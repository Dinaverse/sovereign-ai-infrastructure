# 🏗️ Sovereign AI Infrastructure

> *Centralized architecture documentation for a distributed, cloud-agnostic AI and security laboratory engineered for resilience, privacy, and bare-metal performance.*

---

## 🎯 Overview

This repository is the **single source of truth** for the architecture and operational design of the sovereign computing lab. It documents the multi-node topology, hardware specifications, software stack, and operational procedures.

The lab converts repurposed enterprise-grade hardware into a distributed, multi-node computing cluster capable of high-performance local AI inference with zero cloud dependencies.

---

## 🖥️ Node Inventory

| Node | Hostname | OS | Role | Hardware |
|------|----------|-----|------|----------|
| 🧠 | **Arch-GPU** | Arch Linux | GPU Compute / LLM Inference | 4x NVIDIA P106-100 (24 GB VRAM) |
| 🔴 | **Kali-Master** | Kali Linux | Master Orchestrator / SecOps | x86 workstation |
| 🥧 | **Raspberry-Pi** | Raspbian | IDS / DNS / Network Services | ARM SBC |
| 🖧 | **Dell-Gateway** | Debian | Gateway / Monitoring | Enterprise rack unit |
| 💾 | **AMD-Storage** | Ubuntu Server | Storage Worker / CPU Compute | AMD Canwork189 |

---

## ⚙️ Core Infrastructure Stack

```text
🐧 OS Layer        ::  Arch Linux, Kali Linux, Debian, Raspbian
🐳 Containers      ::  Docker, Docker Compose
🤖 AI Runtime      ::  Ollama (local LLM), CUDA, Multi-GPU VRAM pooling
📊 Monitoring      ::  Prometheus, Grafana, custom Python agents
🛡️ Security        ::  Suricata IDS, custom log analytics, NVIDIA Morpheus (AI SecOps)
🌐 Networking      ::  VLAN segmentation, custom DNS, SSH hardening, Tailscale (remote access)
```

---

## 🏗️ Lab Topology

```
[Internet]
     │
[Dell Gateway / Monitoring Node]
     │
[Internal LAN (192.168.x.0/24)]
     ├── [Kali Master Orchestrator & SecOps Hub]
     ├── [Arch GPU Compute Cluster]   ← 4x NVIDIA P106-100 / 24 GB VRAM
     ├── [Raspberry Pi IDS / DNS / Network Services]
     └── [AMD Canwork189 Storage & CPU Worker]
```

---

## 🤖 AI Inference Layer

| Component | Details |
|-----------|---------|
| **Runtime** | Ollama (local, no cloud) |
| **Model** | Qwen 3.5:27B |
| **GPU Setup** | 4x NVIDIA P106-100 (6 GB each) = 24 GB VRAM total |
| **Framework** | CUDA multi-GPU with layer offloading |
| **Host OS** | Arch Linux (optimized kernel + DKMS) |

---

## 📊 Monitoring & Observability

- **Grafana** → Real-time dashboards for GPU metrics, system health, network traffic
- **Prometheus** → Metrics collection across all nodes
- **Suricata IDS** → Network intrusion detection on Raspberry Pi node
- **Custom Python Agents** → Host-level log analytics and anomaly detection

---

## 🛡️ Security Architecture

- **SSH key-based authentication** across all nodes
- **VLAN segmentation** for service isolation
- **MCP Bridge on Kali** for direct security tool execution via AI agent
- **AI-driven threat detection** via NVIDIA Morpheus pipeline
- **Zero cloud exposure** — all data and inference remains on-premises

---

## 📁 Repository Structure

```
sovereign-ai-infrastructure/
├── README.md                          (this file)
├── docker-compose/
│   └── README.md                      Docker hosting layer documentation
├── hardware-bom/
│   └── README.md                      Hardware specifications & inventory
├── orchestration/
│   └── README.md                      Orchestration methodology & SOPs
├── network-topology/                  Network diagrams & VLAN config (planned)
└── recovery-procedures/               Node recovery & disaster recovery (planned)
```

---

## 🔗 Related Repositories

| Repository | Purpose | Status |
|------------|---------|--------|
| [`local-ai-sovereign-stack`](https://github.com/Dinaverse/local-ai-sovereign-stack) | Docker AI stack deployment (Ollama + Grafana + n8n) | ✅ Active |
| [`arch-linux-multi-gpu-llm`](https://github.com/Dinaverse/arch-linux-multi-gpu-llm) | GPU cluster optimization & CUDA tuning | ✅ Active |
| [`cybersecurity-lab-automation`](https://github.com/Dinaverse/cybersecurity-lab-automation) | Security automation & log monitoring agents | ✅ Active |
| [`sovereign-ai-security`](https://github.com/Dinaverse/sovereign-ai-security) | NVIDIA Morpheus & AI-driven security tooling | ✅ Active |
| [`sovereign-ai-skills`](https://github.com/Dinaverse/sovereign-ai-skills) | Custom AI skills & Gemini CLI integration | ✅ Active |
| [`n8n-automation-hub`](https://github.com/Dinaverse/n8n-automation-hub) | Workflow automation definitions | ✅ Active |
| [`infrastructure-as-code-lab`](https://github.com/Dinaverse/infrastructure-as-code-lab) | IaC experiments & deployment frameworks | 🔄 In Development |
| [`proxmox-homelab-setup`](https://github.com/Dinaverse/proxmox-homelab-setup) | Proxmox hypervisor & LXC containerization | ✅ Active |

---

## ✅ Operational Status

| Service | Status | Last Verified |
|---------|--------|---|
| Multi-GPU LLM Inference (Qwen 3.5:27B) | ✅ Stable | 2026-07-05 |
| Ollama Distributed Inference | ✅ Active | 2026-07-05 |
| Grafana / Prometheus Stack | ✅ Active | 2026-07-05 |
| Suricata IDS (Raspberry Pi) | ✅ Active | 2026-07-05 |
| MCP Bridge (Kali) | ✅ Active | 2026-07-05 |
| n8n Workflow Automation | ✅ Operational | 2026-07-05 |
| Docker Containerized Services | ✅ Operational | 2026-07-05 |

---

## 🚀 Quick Start

### Deploy the Full Stack
```bash
git clone https://github.com/Dinaverse/local-ai-sovereign-stack
cd local-ai-sovereign-stack
docker compose up -d
```

### Verify Services
```bash
docker compose ps
```

### Monitor
- **Grafana:** http://localhost:3000
- **Prometheus:** http://localhost:9090
- **Ollama API:** http://localhost:11434

---

## 📖 Documentation Map

Start here based on your goal:

| Goal | Start With |
|------|------------|
| Understand the overall architecture | This README |
| Deploy Docker services | `docker-compose/README.md` |
| Check hardware specs | `hardware-bom/README.md` |
| Manage & orchestrate services | `orchestration/README.md` |
| Set up GPU inference | [`arch-linux-multi-gpu-llm`](https://github.com/Dinaverse/arch-linux-multi-gpu-llm) |
| Deploy Proxmox hypervisor | [`proxmox-homelab-setup`](https://github.com/Dinaverse/proxmox-homelab-setup) |
| Configure security automation | [`cybersecurity-lab-automation`](https://github.com/Dinaverse/cybersecurity-lab-automation) |

---

*Sovereign by design — every component runs locally, owned entirely, zero cloud dependencies.*
