"""Render every prompt in prompts.json with the OpenAI image API.

Requires OPENAI_API_KEY. The model defaults to gpt-image-2 (ChatGPT Image 2);
override with OPENAI_IMAGE_MODEL. Images already in images/ are skipped, so the
script can be rerun after a failure. Usage:

    pip install openai
    python generate_images.py            # all scenes
    python generate_images.py 001 017    # only these ids
"""
import base64
import json
import os
import pathlib
import sys

from openai import OpenAI

MODEL = os.environ.get("OPENAI_IMAGE_MODEL", "gpt-image-2")
SIZE = "1536x1024"  # landscape


def main():
    here = pathlib.Path(__file__).parent
    out = here / "images"
    out.mkdir(exist_ok=True)
    scenes = json.loads((here / "prompts.json").read_text())
    only = set(sys.argv[1:])
    client = OpenAI()

    for s in scenes:
        if only and s["id"] not in only:
            continue
        path = out / f"{s['id']}_{s['timestamp'].replace(':', '-')}.png"
        if path.exists():
            continue
        print(f"[{s['id']}] {s['timestamp']} {s['narration'][:60]}")
        result = client.images.generate(model=MODEL, prompt=s["prompt"], size=SIZE, n=1)
        path.write_bytes(base64.b64decode(result.data[0].b64_json))


if __name__ == "__main__":
    main()
