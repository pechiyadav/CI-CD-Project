# Phase 2 – Design

This folder defines the technical blueprint for our mini CI/CD project.

| File | What It Describes |
|------|-------------------|
| `architecture.md` | Mermaid system diagram, port map, env var table |
| `.gitlab-ci.yml` | Pipeline stages & jobs (lint, test, build, scan, deploy) |
| `Dockerfile` | Instructions to build the application image |
| `deploy/deploy_vm.sh` | Idempotent script the CI job executes over SSH |
| `app/main.py` | “Hello world” FastAPI entry‑point (for reference) |
