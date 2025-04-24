# Architecture Overview

```mermaid
flowchart TD
    subgraph GitLab
        P[Pipeline<br/>(.gitlab-ci.yml)]
        P --> L(Lint ruff)
        L --> T(Pytest)
        T --> B(Build Docker Image)
        B --> S(Trivy Scan)
        S --> D(SSH Deploy Script)
    end
    D -->|pull image| VM[Docker Host VM]
    VM --> C[Container: fastapi-demo<br/>:80->8000]
