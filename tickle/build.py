"""Build timestamped image prompts from beats.py.

The script has no timestamps, so they are estimated from narration pace:
each beat starts after the cumulative word count of the beats before it,
read at WPM words per minute. Adjust WPM to match the real voiceover.
"""
import json
import pathlib

from beats import BEATS

WPM = 150

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
    "short, in capital letters, and spelled exactly as given."
)


def ts(seconds):
    m, s = divmod(int(round(seconds)), 60)
    return f"{m}:{s:02d}"


def main():
    here = pathlib.Path(__file__).parent
    words = 0
    scenes = []
    for i, (text, scene) in enumerate(BEATS, 1):
        start = words * 60 / WPM
        words += len(text.split())
        scenes.append({
            "id": f"{i:03d}",
            "timestamp": ts(start),
            "narration": text,
            "scene": scene,
            "prompt": f"{scene}\n\nStyle: {STYLE}",
        })

    (here / "prompts.json").write_text(json.dumps(scenes, indent=2, ensure_ascii=False) + "\n")

    lines = [
        "# Why You Can't Tickle Yourself — image prompts",
        "",
        f"{len(scenes)} images. Timestamps are estimated at {WPM} words per minute "
        f"(total runtime about {ts(words * 60 / WPM)}); change `WPM` in `build.py` "
        "and rerun it to match the real voiceover.",
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
    print(f"{len(scenes)} scenes, runtime ~{ts(words * 60 / WPM)}")


if __name__ == "__main__":
    main()
