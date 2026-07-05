# 🐳 Sovereign Docker Hosting

> *Production Docker hosting layer for the sovereign lab — all services containerized, orchestrated via Docker Compose, fully on-premises with zero cloud dependencies.*

---

## 🎯 Overview

This directory documents the Docker hosting layer of the sovereign lab infrastructure. All services are containerized and orchestrated via Docker Compose, providing isolation, reproducibility, and operational consistency across deployments.

**Status:** ✅ Active — All services running and monitored

---

## 🧩 Hosted Services

| Service | Role | Technology | Port | Host |
|---------|------|-----------|------|------|
| **Ollama** | Local LLM inference runtime | Ollama + CUDA | 11434 | Arch-GPU |
| **Grafana** | Monitoring dashboards | Grafana | 3000 | Dell-Gateway |
| **Prometheus** | Metrics collection | Prometheus | 9090 | Dell-Gateway |
| **n8n** | Workflow automation | n8n | 5678 | Docker host |
| **Portainer** | Docker management UI | Portainer | 9443 | Docker host |
| **Jellyfin** | Video streaming | Jellyfin | 8090 | Proxmox CT 101 |
| **Navidrome** | Music streaming | Navidrome | 4533 | Proxmox CT 101 |
| **Home Assistant** | Home automation | Home Assistant | 8123 | Proxmox CT 104 |

---

## 🏗️ Architecture

```
[Docker Host: Arch Linux / Dell Node]
         │
    [Docker Engine]
         │
    ┌────┴────────────────────────────────┐
    │                                     │
[Ollama Container]            [Monitoring Stack]
  ├── GPU 0: P106-100             ├── Grafana :3000
  ├── GPU 1: P106-100             ├── Prometheus :9090
  ├── GPU 2: P106-100             └── Node Exporter
  └── GPU 3: P106-100
         │
    [n8n Automation]
         │
   [Autonomous Workflows]
```

---

## 🔧 Key Concepts

### Container Isolation
Each service runs in its own container with scoped network access. Inter-service communication uses a dedicated Docker bridge network. No host-network exposure unless explicitly required by the service.

### Persistent Storage
All stateful services (Grafana, Prometheus, Ollama models) use named Docker volumes mapped to the host filesystem for data persistence across container restarts and node failures.

### Reproducibility
The entire stack is defined in version-controlled `docker-compose.yml` files. A single `docker compose up -d` restores the full environment from any node running Docker.

### Monitoring
All services expose metrics to Prometheus. Health checks validate service availability. Grafana dashboards provide real-time visibility into service health, resource usage, and inference throughput.

---

## 📁 Directory Structure

```
docker-compose/
├── README.md                          (this file)
├── docker-compose.yml                 Main service definitions
├── .env                               Environment configuration
├── ollama/
│   ├── Dockerfile                     Custom Ollama runtime
│   ├── modelfile                      Model configuration
│   └── entrypoint.sh                  Startup script
├── prometheus/
│   ├── prometheus.yml                 Scrape targets & alerting rules
│   ├── alerts.yml                     Alert definitions
│   └── recording_rules.yml            Aggregation rules
├── grafana/
│   ├── provisioning/
│   │   ├── datasources/               Prometheus data source config
│   │   └── dashboards/                Dashboard provisioning
│   └── dashboards/
│       ├── ai-metrics.json            LLM inference metrics
│       ├── gpu-performance.json       GPU utilization dashboard
│       └── system-health.json         System-wide health
└── n8n/
    └── workflows/
        ├── inference-triggers.json    Automated inference
        └── alert-response.json        Alert-driven workflows
```

---

## 🚀 Deployment

### Prerequisites
- Docker Engine 20.10+
- Docker Compose 2.0+
- Linux host (Arch, Debian, Ubuntu)
- 24 GB VRAM (for Qwen 3.5:27B, adjust for smaller models)

### Quick Start

```bash
# Navigate to docker-compose directory
cd /path/to/docker-compose

# Create environment file
cp .env.example .env
# Edit .env with your configuration

# Start all services
docker compose up -d

# Verify services
docker compose ps

# View logs
docker compose logs -f
```

### Service-Specific Start

```bash
# Start only Ollama + Prometheus
docker compose up -d ollama prometheus

# Start only Grafana + n8n
docker compose up -d grafana n8n

# Rebuild and restart a service
docker compose up -d --build ollama
```

---

## 📊 Monitoring & Access

| Service | URL | Purpose | Credentials |
|---------|-----|---------|-------------|
| **Grafana** | http://localhost:3000 | GPU metrics, inference throughput, system health | admin/admin |
| **Prometheus** | http://localhost:9090 | Raw metrics & alerting rules | - |
| **Ollama API** | http://localhost:11434 | LLM inference endpoint | REST API |
| **Portainer** | https://localhost:9443 | Docker management UI | admin/password |

### Example Queries

```bash
# List loaded models
curl http://localhost:11434/api/tags

# Run inference
curl -X POST http://localhost:11434/api/generate \
  -H "Content-Type: application/json" \
  -d '{
    "model": "qwen:27b",
    "prompt": "Hello world",
    "stream": false
  }'

# Check service health
docker compose ps
docker compose exec prometheus curl http://localhost:9090/-/healthy
```

---

## 🔄 Service Management

### Start/Stop Services

```bash
# Start all services
docker compose up -d

# Stop all services
docker compose down

# Restart a specific service
docker compose restart ollama

# Remove all volumes (destructive!)
docker compose down -v
```

### View Logs

```bash
# Real-time logs (all services)
docker compose logs -f

# Logs for specific service
docker compose logs -f ollama

# Last 100 lines
docker compose logs --tail=100 prometheus

# Logs from last hour
docker compose logs --since 1h grafana
```

### Container Inspection

```bash
# List containers
docker compose ps

# Container stats
docker stats

# Enter container shell
docker compose exec ollama bash

# View environment variables
docker compose exec grafana env
```

---

## 🔌 Integration Points

| System | Integration | Details |
|--------|-----------|---------|
| **Arch-GPU Node** | Primary host | Optimal for Ollama (24 GB VRAM, CUDA support) |
| **Dell-Gateway Node** | Monitoring host | Runs Prometheus/Grafana for lab-wide metrics |
| **Raspberry Pi** | Metrics scraping | Suricata IDS sends metrics to Prometheus |
| **Kali-Master** | Security agents | Agents consume metrics and logs from containers |
| **n8n Workflows** | Orchestration | Triggered by Prometheus alerts or time-based schedules |
| **Sovereign AI Skills** | AI prompts | Ollama inference powers custom AI reasoning |

---

## ⚙️ Advanced Configuration

### Custom Models

```bash
# Pull a different model
docker compose exec ollama ollama pull mistral:7b

# Use different model in workflows
# Edit .env: OLLAMA_MODEL=mistral:7b
```

### Prometheus Scrape Targets

Add custom targets in `prometheus/prometheus.yml`:

```yaml
scrape_configs:
  - job_name: 'custom-service'
    static_configs:
      - targets: ['localhost:9100']
    scrape_interval: 15s
```

### GPU Configuration

Edit `docker-compose.yml` to use specific GPUs:

```yaml
services:
  ollama:
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              device_ids: ['0', '1', '2', '3']
              capabilities: [gpu]
```

### Multi-Host Deployment

Deploy services across multiple nodes:

```bash
# On each node, start only required services
docker compose up -d ollama    # On Arch-GPU
docker compose up -d prometheus grafana  # On Dell-Gateway
```

---

## 🔗 Related Repositories

| Repository | Purpose |
|------------|---------|
| [`local-ai-sovereign-stack`](https://github.com/Dinaverse/local-ai-sovereign-stack) | Full AI stack documentation |
| [`sovereign-ai-infrastructure`](https://github.com/Dinaverse/sovereign-ai-infrastructure) | Architecture & node specifications |
| [`arch-linux-multi-gpu-llm`](https://github.com/Dinaverse/arch-linux-multi-gpu-llm) | GPU cluster optimization |
| [`n8n-automation-hub`](https://github.com/Dinaverse/n8n-automation-hub) | Workflow definitions |

---

## 📖 Documentation

- **[Local AI Sovereign Stack](../README.md)** — Complete deployment guide
- **[Orchestration Guide](../sovereign-ai-infrastructure/orchestration/)** — Lab-wide operations

---

## 🐛 Troubleshooting

### GPU Not Detected

```bash
# Check NVIDIA drivers in container
docker compose exec ollama nvidia-smi

# Verify CUDA availability
docker compose exec ollama ollama run qwen:27b "nvidia-smi"
```

### Out of Memory

```bash
# Check resource usage
docker stats

# Reduce model size or enable layer offloading
# Edit docker-compose.yml environment variables
```

### Prometheus Not Scraping

```bash
# Check targets
curl http://localhost:9090/api/v1/targets

# View prometheus logs
docker compose logs prometheus
```

### Container Won't Start

```bash
# Check logs for error details
docker compose logs ollama

# Validate docker-compose.yml syntax
docker compose config

# Remove and recreate
docker compose down ollama
docker compose up -d ollama
```

---

*Containerized sovereignty — every service self-hosted, every layer documented.*
