# Phase 3 – Development

This folder contains source code and tests for the FastAPI demo app.

### Quick‑start (local)

```bash
# 1. Create virtual env
python -m venv .venv && source .venv/bin/activate

# 2. Install deps
pip install -r requirements.txt

# 3. Run app
uvicorn app.main:app --reload --port 8000
