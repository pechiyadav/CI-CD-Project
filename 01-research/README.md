# Phase 1 – Research

This document captures the discovery notes and baseline facts driving our CI/CD design.  
Because the project is intentionally small, we keep the research concise—just what is needed to justify and guide the pipeline we’ll build in later phases.

---

## 1  Project Goal

> **Deliver a minimal FastAPI service** that is automatically linted, tested, containerised, security‑scanned, and deployed to a single Docker host via GitLab CI/CD—no manual steps after pushing to `main`.

---

## 2  Current Assets & Constraints

| Item | Detail |
|------|--------|
| **Source Control** | GitLab.com free tier, new blank repo |
| **Build Runners** | GitLab shared SaaS runners (400 CI min/mo) |
| **Target Host** | Single VM you already own (Ubuntu 20 LTS, Docker 24) |
| **Network** | VM accessible on public IP :22 (SSH) and :80 (HTTP) |
| **Compliance / Security** | No formal frameworks; basic security scans & SSH key auth are enough |
| **Budget** | Aim for **$0/month** beyond VM cost; use only free‑tier services |

---

## 3  Stakeholders & Expectations

| Role | Interest | Key Expectation |
|------|----------|-----------------|
| **You (Developer/Owner)** | Push code & see it live fast | Lead‑time ≤ 5 min |
| **Future Collaborators** | Understand simple pipeline, forkable demo | Docs & code < 5 files to grok |
| **Ops (could be you)** | VM stability, logs, easy rollback | One‑command container restart |

---

## 4  Success Metrics (SLIs / SLOs)

| Metric | Target (SLO) | How Measured |
|--------|--------------|--------------|
| **Lead‑time (commit→prod)** | ≤ 5 minutes (P95) | GitLab pipeline + deploy timestamp |
| **Deployment Failure Rate** | < 5 % of pipelines | Non‑zero exit in deploy stage |
| **Manual Steps per Deploy** | **Zero** | Observation |

---

## 5  Chosen Toolchain Justification

| Function | Tool | Rationale |
|----------|------|-----------|
| Version Control & CI | **GitLab.com** | All‑in‑one platform with built‑in container registry |
| App Framework | **FastAPI** | Single‑file Hello‑World, async ready |
| Packaging | **Docker** | Portable, mirrors prod |
| Linting | **ruff** | Fast Python linter |
| Testing | **pytest** | De‑facto standard |
| Vulnerability Scan | **Trivy** | One‑liner image scan, free |
| Deployment | **docker run** via **SSH** | Simplest path—no k8s/Helm overhead |

---

## 6  High‑Level Flow Diagram

```mermaid
flowchart LR
    A[Developer Push] --> B[GitLab Pipeline]
    B --> C[Lint + Unit Tests]
    C --> D[Build & Push Docker Image]
    D --> E[Trivy Scan]
    E --> F[SSH to VM]
    F --> G[Stop Old Container]
    G --> H[Run New Image on Port 80]
