"""Record Higgsfield job IDs/URLs: python3 log_jobs.py '<json list of {index, job_id, result_url?}>'"""
import json, sys, pathlib
p = pathlib.Path(__file__).with_name("jobs.json")
j = json.loads(p.read_text()) if p.exists() else {}
for item in json.loads(sys.argv[1]):
    e = j.setdefault(str(item["index"]), {})
    e["job_id"] = item["job_id"]
    if item.get("result_url"):
        e["url"] = item["result_url"]
p.write_text(json.dumps({k: j[k] for k in sorted(j, key=int)}, indent=1))
print(len(j), "logged,", sum("url" in v for v in j.values()), "with urls")
