# Phase 4 – Testing

Adds two new quality gates:

1. **Coverage Analysis** – pytest generates coverage XML; GitLab shows trends & badge.
2. **Smoke Test** – after deployment, a bash script pings live URL (`/healthz`) and fails if not **200 OK**.

Both jobs run automatically in the pipeline.
