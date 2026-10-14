"""Generate the voiceover for a script with VoiceStudio's OmniVoice engine.

    python narrate.py sneako [--voicestudio PATH] [--model k2-fsa/OmniVoice]

Every beat in <script>/beats.py is spoken in the VoiceStudio demo voice and
saved to <script>/voiceover/NNN.wav. The beats are then joined into
<script>/voiceover/full.wav with natural pauses, and the real start time of
each beat is written to <script>/voiceover/timings.json so the images can be
timed to the actual narration instead of the estimate in build.py.

Beats that already have a wav are skipped, so an interrupted run resumes.
"""
import argparse
import importlib.util
import json
import pathlib
import sys

GAP = 0.35               # silence between beats
PAUSE_PARAGRAPH = 0.70   # added after the last beat of a paragraph

DEMO_REF_TEXT = (
    "Hey. I'm the VoiceStudio demo voice. I was made right here, on your "
    "machine: private, local, and ready whenever you are."
)

# How numbers in the scripts are spoken aloud.
SPOKEN = {"2026": "twenty twenty six", "2025": "twenty twenty five"}


def load_beats(folder):
    spec = importlib.util.spec_from_file_location("beats", folder / "beats.py")
    beats = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(beats)
    return (beats.BEATS, getattr(beats, "PARAGRAPH_ENDS", set()),
            getattr(beats, "VIEWER_PAUSES", {}))


def main():
    here = pathlib.Path(__file__).parent
    parser = argparse.ArgumentParser()
    parser.add_argument("script", help="script folder, e.g. sneako or tickle")
    parser.add_argument("--voicestudio", default=here.parent / "VoiceStudio",
                        type=pathlib.Path, help="VoiceStudio checkout")
    parser.add_argument("--model", default="k2-fsa/OmniVoice",
                        help="Hugging Face id or local model folder")
    parser.add_argument("--speed", type=float, default=None)
    args = parser.parse_args()

    sys.path.insert(0, str(args.voicestudio))
    import numpy as np
    import soundfile as sf
    import torch
    from omnivoice.models.omnivoice import OmniVoice

    folder = here / args.script
    out = folder / "voiceover"
    out.mkdir(exist_ok=True)
    beats, paragraph_ends, viewer_pauses = load_beats(folder)

    device = "cuda" if torch.cuda.is_available() else "cpu"
    dtype = torch.float16 if device == "cuda" else torch.float32
    print(f"Loading {args.model} on {device}...", flush=True)
    model = OmniVoice.from_pretrained(args.model, torch_dtype=dtype).to(device).eval()
    rate = model.sampling_rate
    prompt = model.create_voice_clone_prompt(
        ref_audio=str(args.voicestudio / "backend/assets/samples/demo_voice.wav"),
        ref_text=DEMO_REF_TEXT,
    )

    for i, (narration, _) in enumerate(beats, 1):
        path = out / f"{i:03d}.wav"
        if path.exists():
            continue
        text = narration
        for num, spoken in SPOKEN.items():
            text = text.replace(num, spoken)
        audio = model.generate(text=text, language="English",
                               voice_clone_prompt=prompt, speed=args.speed)
        sf.write(path, audio[0].squeeze(0).float().cpu().numpy(), rate)
        print(f"{i}/{len(beats)} {narration}", flush=True)

    clock, parts, timings = 0.0, [], []
    for i, (narration, _) in enumerate(beats, 1):
        clip, _ = sf.read(out / f"{i:03d}.wav", dtype="float32")
        pause = GAP + viewer_pauses.get(i, 0)
        if i in paragraph_ends:
            pause += PAUSE_PARAGRAPH
        timings.append({"image": f"{i:03d}", "start": round(clock, 2),
                        "speech": round(len(clip) / rate, 2),
                        "narration": narration})
        parts += [clip, np.zeros(int(pause * rate), dtype="float32")]
        clock += len(clip) / rate + pause

    sf.write(out / "full.wav", np.concatenate(parts), rate)
    (out / "timings.json").write_text(json.dumps(timings, indent=2) + "\n")
    m, s = divmod(int(round(clock)), 60)
    print(f"Wrote {out / 'full.wav'} ({m}:{s:02d})")


if __name__ == "__main__":
    main()
