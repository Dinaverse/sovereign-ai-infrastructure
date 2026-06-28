# 🐳 Sovereign Docker Hosting

> *Documentation and configuration for Docker-based application hosting within the sovereign lab containerized services running fully on-premises with no cloud dependencies.*

---

## 🎯 Overview

This repository documents the Docker hosting layer of the sovereign lab infrastructure. All services are containerized and orchestrated via Docker Compose, providing isolation, reproducibility, and easy redeployment across nodes.

---

## 🧩 Hosted Services

| Service | Role | Port |
|---------|------|------|
| **Ollama** | Local LLM inference runtime | 11434 |
| **Grafana** | Monitoring dashboards | 3000 |
| **Prometheus** | Metrics collection | 9090 |
| **n8n** | Workflow automation | 5678 |
| **Portainer** | Docker management UI | 9443 |

---

## 🏗️ Architecture

```
[Docker Host Arch / Dell Node]
        │
  [Docker Engine]
        ├── ollama        (LLM inference)
        ├── grafana       (dashboards)
        ├── prometheus    (metrics)
        ├── n8n           (automation)
        └── portainer     (management)
```

---

## 🔧 Key Concepts

### Container Isolation
Each service runs in its own container with scoped network access. Inter-service communication uses a dedicated Docker bridge network no host-network exposure unless required.

### Persistent Storage
All stateful services (Grafana, Prometheus, Ollama models) use named Docker volumes mapped to the host filesystem for data persistence across container restarts.

### Reproducibility
The entire stack is defined in `docker-compose.yml` a single `docker compose up -d` restores the full environment from any node.

---

## 🔗 Related Repositories

| Repository | Role |
|------------|------|
| [`local-ai-sovereign-stack`](https://github.com/Dinaverse/local-ai-sovereign-stack) | Full AI stack docker-compose |
| [`sovereign-lab-orchestration`](https://github.com/Dinaverse/sovereign-lab-orchestration) | Orchestration methodology |
| [`sovereign-ai-infrastructure`](https://github.com/Dinaverse/sovereign-ai-infrastructure) | Node architecture |

---

*Containerized sovereignty every service self-hosted, every layer documented.*
