#!/usr/bin/env bash
# PreToolUse: main push, force push, rm -rf, .env 접근 차단 (exit 2 = 차단, stderr는 Claude에게 전달)
input="$(cat)"
python3 - "$input" <<'PY'
import json, re, sys
data = json.loads(sys.argv[1] or "{}")
tool = data.get("tool_name", "")
ti = data.get("tool_input", {}) or {}

def block(msg):
    print(f"[guard] 차단: {msg}", file=sys.stderr)
    sys.exit(2)

env_re = re.compile(r"(^|[/\s'\"])\.env(\.(?!example\b)[\w.-]+)?($|[\s'\"])")

if tool == "Bash":
    cmd = ti.get("command", "")
    if re.search(r"\bgit\s+push\b.*(--force\b|--force-with-lease\b|\s-f\b)", cmd):
        block("force push는 금지예요. 새 커밋으로 해결해 주세요.")
    if re.search(r"\bgit\s+push\b(?:\s+-\S+)*\s+\S+\s+(?:\S+:)?(?:refs/heads/)?(main|master)(?=\s|$|;|&|\|)", cmd):
        block("main에 직접 push할 수 없어요. 기능 브랜치와 PR을 쓰세요.")
    if re.search(r"\brm\s+-[a-zA-Z]*r[a-zA-Z]*f|\brm\s+-[a-zA-Z]*f[a-zA-Z]*r", cmd):
        block("rm -rf는 사람 확인이 필요해요. 지울 대상과 이유를 먼저 물어보세요.")
    if env_re.search(cmd):
        block(".env 파일은 다루지 않아요. 새 변수는 .env.example에만 추가하세요.")
elif tool in ("Read", "Edit", "Write", "MultiEdit"):
    path = ti.get("file_path", "")
    name = path.rsplit("/", 1)[-1]
    if name == ".env" or (name.startswith(".env.") and name != ".env.example"):
        block(".env 파일은 읽거나 수정하지 않아요. .env.example을 쓰세요.")
sys.exit(0)
PY
