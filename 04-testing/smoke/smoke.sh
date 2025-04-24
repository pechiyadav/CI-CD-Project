#!/usr/bin/env bash
set -euo pipefail

URL="http://${VM_HOST}/healthz"
echo "Smoke‑testing ${URL} …"

for i in {1..10}; do
  code=$(curl -s -o /dev/null -w "%{http_code}" "$URL" || true)
  if [ "$code" = "200" ]; then
    echo "✅  Healthy!"
    exit 0
  fi
  echo "Attempt $i/10 failed (code=$code); retrying in 3s…"
  sleep 3
done

echo "❌  Smoke test failed"
exit 1
