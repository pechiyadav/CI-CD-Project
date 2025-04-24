# Phase 5 – Deployment Enhancements

Adds:
1. **Prod promotion** on Git tags (`vX.Y.Z`).
2. **Automatic rollback** – if post‑deploy smoke fails, CI redeploys previous good image.
3. (Optional) Cosign image signature.
