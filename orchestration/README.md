# 🌐 Sovereign Lab Orchestration

> *Methodology, principles, and tooling for managing a distributed, resilient bare-metal laboratory as a unified, code-defined system.*

---

## 🎯 Philosophy

The sovereign lab is treated as a **living system**, not a collection of individual machines. Every configuration decision is reproducible, every service dependency is documented, and every node can be recovered from scratch using version-controlled code.

---

## 🧩 Orchestration Principles

### 1. Infrastructure-as-Code
Every service, network rule, and system configuration is defined in version-controlled files. No snowflake servers. Everything is reproducible and auditable.

### 2. Resilience by Design
Services are distributed across multiple nodes. No single point of failure for critical workloads. Monitoring detects degradation before it becomes an outage. Data is backed up across nodes.

### 3. Sovereign Execution
No external orchestration platforms (no Kubernetes cloud, no managed services). The lab is self-managed using Docker Compose, systemd, and custom Bash/Python tooling running entirely on-premises.

### 4. Observability First
Every node ships metrics to Prometheus. Every anomaly triggers an alert. Grafana dashboards provide real-time visibility across the entire lab. Logs are collected centrally for analysis.

### 5. Automation & Intelligence
n8n workflows orchestrate complex tasks. Custom AI agents (Gemini CLI + Ollama) execute infrastructure decisions. Security agents continuously monitor logs and network traffic.

---

## 🏗️ Lab Node Map

| Node | OS | Role | Managed By | Services |
|------|----|------|-----------|----------|
| **Kali-Master** | Kali Linux | Master orchestrator, SecOps, MCP Bridge | Manual + Ansible scripts | Security agents, MCP bridge, orchestration |
| **Arch-GPU** | Arch Linux | GPU inference cluster, Ollama + CUDA | systemd + custom Python agents | Ollama, LLM inference, GPU monitoring |
| **Raspberry-Pi** | Raspbian | IDS, DNS, network services | systemd + Suricata rules | Suricata IDS, DNS, network monitoring |
| **Dell-Gateway** | Debian | Gateway, monitoring, reverse proxy | Docker Compose + cron | Prometheus, Grafana, NPM, Tailscale |
| **AMD-Storage** | Ubuntu Server | Distributed storage, CPU-bound workloads | Docker Compose | NAS, backup, CPU processing |

---

## 🔄 Orchestration Stack

```text
📦 Containerization   ::  Docker, Docker Compose (service isolation)
⚙️ Service Management  ::  systemd (GPU persistence, auto-restart)
🔁 Automation          ::  n8n workflows (scheduled/event-driven tasks)
🤖 AI Orchestration    ::  Ollama + Gemini CLI + sovereign-ai-skills
📊 Observability       ::  Prometheus (metrics) + Grafana (dashboards)
🛡️ Security Ops        ::  Custom Python agents + NVIDIA Morpheus
🌐 Networking          ::  Tailscale (remote access), firewall rules
```

---

## 📋 Standard Operating Procedures

### Deploying a New Service

1. **Define service** in relevant `docker-compose.yml` or systemd unit file
2. **Add Prometheus scrape target** in `prometheus/prometheus.yml`
3. **Create Grafana dashboard panel** or alert rule for visibility
4. **Document in this repository** — operational notes, dependencies, recovery steps
5. **Test on development node** before production deployment
6. **Commit to version control** — no manual changes outside of git

### Node Recovery Procedure

```bash
# 1. Restore base OS from documented config (see recovery-procedures/)
# 2. Clone relevant repositories
git clone https://github.com/Dinaverse/sovereign-ai-infrastructure
git clone https://github.com/Dinaverse/local-ai-sovereign-stack

# 3. Run Docker Compose or systemd unit files
docker compose up -d
systemctl start ollama

# 4. Verify services
docker compose ps
systemctl status ollama

# 5. Confirm metrics flowing to Prometheus
curl http://prometheus-host:9090/api/v1/targets

# 6. Restore data from backups if needed
# (see recovery-procedures/backup-restoration.md)
```

### Adding a New Node to the Lab

```bash
# 1. Bootstrap with SSH key-based auth
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@new-node

# 2. Install Docker & systemd (Ansible playbook - planned)
ansible-playbook infrastructure-as-code-lab/ansible/base-os-setup.yml

# 3. Deploy services
docker compose up -d

# 4. Add to Prometheus inventory
# (edit prometheus/prometheus.yml, add new scrape target)

# 5. Verify metrics collection
curl http://prometheus-host:9090/api/v1/targets
```

---

## 📊 Monitoring & Alerting

### Key Metrics

| Metric | Source | Alert Threshold | Action |
|--------|--------|---|--------|
| GPU Memory Utilization | Ollama | > 90% | Scale inference requests or trigger layer offloading |
| CPU Load Average | Node Exporter | > 4.0 (on 4-core) | Distribute workload to other nodes |
| Prometheus Disk Space | Prometheus | < 10% free | Purge old metrics or expand storage |
| Suricata Alert Count | Suricata | > 100/min | Trigger security investigation workflow |
| Docker Container Restart | Docker events | > 5/hour | Check logs for service health issues |
| Network Latency (inter-node) | Ping metrics | > 50ms | Investigate network congestion |

### Grafana Dashboards

- **AI Metrics** — LLM inference throughput, latency, model accuracy
- **GPU Performance** — VRAM utilization, compute efficiency, thermal temps
- **System Health** — CPU, memory, disk, network across all nodes
- **Security Events** — IDS alerts, failed logins, suspicious traffic
- **Service Status** — Docker container health, systemd unit status

---

## 🔗 Workflow Examples

### Automated Inference Trigger (n8n)

```
[External HTTP Request]
     ↓
[n8n Webhook Trigger]
     ↓
[Validate Request Parameters]
     ↓
[POST to Ollama API]
     ↓
[Return Inference Result]
```

### Alert-Driven Security Response (n8n + Security Agents)

```
[Prometheus Alert: High Failed Logins]
     ↓
[n8n Webhook Receiver]
     ↓
[Security Agent Investigation]
     ↓
[Collect Logs from Affected Node]
     ↓
[Trigger Incident Response Workflow]
```

### Scheduled Lab Health Check

```
[Cron Trigger: Daily 2 AM]
     ↓
[n8n Health Check Workflow]
     ↓
[Verify All Services Running]
     ↓
[Check Disk Space, Backups, Metrics]
     ↓
[Generate Health Report]
     ↓
[Alert on Anomalies]
```

---

## 📁 Directory Structure

```
orchestration/
├── README.md                          (this file)
├── systemd/
│   ├── ollama.service                 GPU inference persistence
│   ├── security-agent.service         Log monitoring agent
│   └── net-analyzer.service           Network recon agent
├── prometheus/
│   ├── prometheus.yml                 Scrape targets
│   ├── alerts.yml                     Alert rules
│   └── recording_rules.yml            Metric aggregation
├── grafana/
│   ├── datasources/                   Prometheus connection
│   └── dashboards/
│       ├── ai-metrics.json
│       ├── gpu-performance.json
│       ├── system-health.json
│       └── security-events.json
├── n8n/
│   ├── workflows/
│   │   ├── inference-triggers.json    Automated inference
│   │   ├── alert-response.json        Security response
│   │   └── health-check.json          Daily verification
│   └── credentials/                   (secrets, not in git)
├── scripts/
│   ├── bootstrap.sh                   Initial node setup
│   ├── deploy-stack.sh                Full lab deployment
│   ├── validate-deployment.sh         Health verification
│   └── backup-data.sh                 Automated backups
└── recovery-procedures/
    ├── README.md                      Disaster recovery guide
    ├── node-recovery.md               Single node recovery
    ├── backup-restoration.md          Data restoration steps
    └── network-reconfiguration.md     Network repair procedures
```

---

## 🔗 Related Repositories

| Repository | Purpose |
|------------|---------|
| [`sovereign-ai-infrastructure`](https://github.com/Dinaverse/sovereign-ai-infrastructure) | Central architecture documentation |
| [`local-ai-sovereign-stack`](https://github.com/Dinaverse/local-ai-sovereign-stack) | Docker service deployment |
| [`infrastructure-as-code-lab`](https://github.com/Dinaverse/infrastructure-as-code-lab) | IaC frameworks (Terraform, Ansible) |
| [`n8n-automation-hub`](https://github.com/Dinaverse/n8n-automation-hub) | Workflow definitions |
| [`sovereign-ai-skills`](https://github.com/Dinaverse/sovereign-ai-skills) | AI agent capabilities |
| [`cybersecurity-lab-automation`](https://github.com/Dinaverse/cybersecurity-lab-automation) | Security automation agents |

---

## 🚀 Quick Reference

### Check All Services

```bash
# Docker services
docker compose ps

# systemd services
systemctl status ollama
systemctl status security-agent

# Prometheus metrics
curl http://localhost:9090/api/v1/query?query=up
```

### Restart All Services

```bash
# Docker
docker compose restart

# systemd
systemctl restart ollama security-agent net-analyzer
```

### View Logs

```bash
# Docker
docker compose logs -f ollama

# systemd
journalctl -u ollama -f
```

### Trigger Workflow

```bash
# n8n API
curl -X POST http://localhost:5678/webhook/inference \
  -H "Content-Type: application/json" \
  -d '{"prompt": "Hello", "model": "qwen:27b"}'
```

---

## 📖 Additional Resources

- **[Node Recovery Procedures](recovery-procedures/README.md)** — Disaster recovery runbooks
- **[Backup & Restoration](recovery-procedures/backup-restoration.md)** — Data protection strategy
- **[Network Configuration](recovery-procedures/network-reconfiguration.md)** — Network troubleshooting

---

*A lab that documents itself — because infrastructure without documentation is just expensive hardware.*
