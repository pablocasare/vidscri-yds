"""Build timestamped image prompts from beats.py.

The script has no timestamps, so they are estimated as a human narrator would
read it in real time: speech time from syllable count, plus natural pauses at
commas, sentence ends, paragraph breaks, dramatic one-liners, and the moments
where the narrator asks the viewer to try something. Tune the constants below
to match the real voiceover.
"""
import json
import pathlib
import re

from beats import BEATS, PARAGRAPH_ENDS, VIEWER_PAUSES

SYLLABLES_PER_SEC = 3.7   # ~155 words per minute, a relaxed YouTube narration
PAUSE_COMMA = 0.20
PAUSE_COLON = 0.30
PAUSE_SENTENCE = 0.45
PAUSE_QUESTION = 0.60
PAUSE_PARAGRAPH = 0.70    # added on top of the sentence pause
PAUSE_DRAMATIC = 0.80     # extra for a one-line paragraph of five words or fewer

# How numbers in the script are spoken aloud.
SPOKEN = {"2026": "twenty twenty six", "2025": "twenty twenty five"}

STYLE = (
    "Extremely simple beginner drawing made in MS Paint, like someone who is "
    "bad at drawing made it quickly with a mouse. Pure white background. "
    "Thick, uneven black outlines. Wobbly hand-drawn lines. Stick figure "
    "humans with round heads and single-line bodies, arms and legs, dot eyes "
    "and a simple line mouth. Few flat colors at most, filled roughly. Not "
    "polished, not professional, funny and crude. Wide horizontal 16:9 YouTube "
    "frame. Clean, readable, centered composition with plenty of empty space "
    "around the characters and objects; nothing important cropped. No extra "
    "details, no messy overlapping objects, no broken anatomy. Any text must be "
    "short, in capital letters, and spelled exactly as given. Real people are "
    "never drawn realistically: they are plain stick figures identified only by "
    "a name label. No real company or platform logos."
)


def syllables(word):
    word = re.sub(r"[^a-z]", "", word.lower())
    if not word:
        return 0
    count = len(re.findall(r"[aeiouy]+", word))
    if word.endswith("e") and not word.endswith(("le", "ee")) and count > 1:
        count -= 1
    return max(count, 1)


def duration(i, text):
    for num, spoken in SPOKEN.items():
        text = text.replace(num, spoken)
    seconds = sum(syllables(w) for w in text.split()) / SYLLABLES_PER_SEC
    body, last = text.rstrip(), text.rstrip()[-1:]
    seconds += body.count(",") * PAUSE_COMMA + body.count(":") * PAUSE_COLON
    inner = re.findall(r"[.?!]\"?\s", body)
    seconds += len(inner) * PAUSE_SENTENCE
    if last == "?" or body.endswith('?"'):
        seconds += PAUSE_QUESTION
    elif last in '.!"':
        seconds += PAUSE_SENTENCE
    elif last == ",":
        seconds += PAUSE_COMMA
    if i in PARAGRAPH_ENDS:
        seconds += PAUSE_PARAGRAPH
        if (i - 1) in PARAGRAPH_ENDS and len(text.split()) <= 5:
            seconds += PAUSE_DRAMATIC
    return seconds + VIEWER_PAUSES.get(i, 0)


def ts(seconds):
    m, s = divmod(int(round(seconds)), 60)
    return f"{m}:{s:02d}"


def main():
    here = pathlib.Path(__file__).parent
    clock = 0.0
    scenes = []
    for i, (text, scene) in enumerate(BEATS, 1):
        start = clock
        clock += duration(i, text)
        scenes.append({
            "id": f"{i:03d}",
            "timestamp": ts(start),
            "narration": text,
            "scene": scene,
            "prompt": f"{scene}\n\nStyle: {STYLE}",
        })

    (here / "prompts.json").write_text(json.dumps(scenes, indent=2, ensure_ascii=False) + "\n")

    lines = [
        "# How Sneako Made Enemies With Everyone — image prompts",
        "",
        f"{len(scenes)} images, total runtime about {ts(clock)}. Timestamps are "
        "estimated as a narrator reading in real time (about 155 words per minute, "
        "with natural pauses at commas, sentence ends and paragraph breaks, and "
        "extra beats where the viewer is asked to try something). Tune the "
        "constants in `build.py` and rerun it to match the real voiceover.",
        "",
        "Every prompt ends with this shared style block:",
        "",
        f"> {STYLE}",
        "",
    ]
    for s in scenes:
        lines += [
            f"## {s['timestamp']} — image {s['id']}",
            "",
            f"**Narration:** {s['narration']}",
            "",
            f"**Image:** {s['scene']}",
            "",
        ]
    (here / "PROMPTS.md").write_text("\n".join(lines))
    print(f"{len(scenes)} scenes, runtime ~{ts(clock)}")


if __name__ == "__main__":
    main()
