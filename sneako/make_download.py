"""Write images.json and download_images.sh from prompts.json + jobs.json."""
import json, pathlib
here = pathlib.Path(__file__).parent
prompts = json.loads((here / "prompts.json").read_text())
jobs = json.loads((here / "jobs.json").read_text())
out, lines = [], []
for p in prompts:
    j = jobs[str(int(p["id"]))]
    out.append({"id": p["id"], "timestamp": p["timestamp"], "narration": p["narration"],
                "job_id": j["job_id"], "url": j["url"]})
    lines.append(f'get {p["id"]}_{p["timestamp"].replace(":", "-")}.png {j["url"]}')
(here / "images.json").write_text(json.dumps(out, indent=1))
(here / "download_images.sh").write_text(f'''#!/bin/bash
# Downloads all {len(out)} images into a folder called "sneako-images", named by
# image number and timestamp (e.g. 001_0-00.png = the image for 0:00).
# Run it from a Terminal:  bash download_images.sh
cd "$(dirname "$0")"
mkdir -p sneako-images
fail=0
get() {{
  [ -s "sneako-images/$1" ] && return
  if curl -fsSL -o "sneako-images/$1" "$2"; then echo "ok   $1"
  else rm -f "sneako-images/$1"; echo "FAIL $1"; fail=1; fi
}}

''' + "\n".join(lines) + '''

if [ $fail = 1 ]; then
  echo "Some images failed. Download those from your Higgsfield project 'How Sneako Made Enemies With Everyone'."
else
  echo "Done! All images are in the sneako-images folder."
fi
''')
print(len(out), "images")
