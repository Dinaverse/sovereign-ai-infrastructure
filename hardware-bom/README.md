<<<<<<< HEAD
# 🏗️ Sovereign AI Infrastructure

> *Centralized architecture documentation for a distributed, cloud-agnostic AI and security laboratory engineered for resilience, privacy, and bare-metal performance.*

---

## 🎯 Overview

This repository is the **single source of truth** for the architecture and operational design of my sovereign computing lab. It documents the multi-node topology, hardware specifications, software stack, and cross-service integration patterns across all nodes.

---

## 🖥️ Node Architecture

### Topology
=======
# 🧪 My Sovereign Lab

> *A self-hosted, bare-metal computing environment engineered for resilience, data sovereignty, and high-performance local AI inference with zero cloud dependencies.*

---

## 🎯 Vision

This laboratory is the physical and logical backbone of all my infrastructure projects. It converts repurposed enterprise-grade hardware into a distributed, multi-node computing cluster capable of running local LLMs, security tooling, network monitoring, and containerized services entirely on-premises.

---

## 🖥️ Node Inventory

| Node | Hostname | Role | Hardware |
|------|----------|------|----------|
| 🧠 | **Arch Linux** | GPU Compute / LLM Inference | 4x NVIDIA P106-100 (24 GB VRAM) |
| 🔴 | **Kali Linux** | Master Orchestrator / SecOps | x86 workstation |
| 🥧 | **Raspberry Pi** | IDS / DNS / Network Services | ARM SBC |
| 🖧 | **Dell Server** | Gateway / Monitoring | Enterprise rack unit |
| 💾 | **AMD Machine** | Storage Worker / CPU Compute | Canwork189 |

---

## 🔗 Ecosystem Repositories

| Repository | Description |
|------------|-------------|
| [`arch-linux-multi-gpu-llm`](https://github.com/Dinaverse/arch-linux-multi-gpu-llm) | 4x GPU cluster for local LLM inference |
| [`sovereign-ai-infrastructure`](https://github.com/Dinaverse/sovereign-ai-infrastructure) | Architecture & node documentation |
| [`local-ai-sovereign-stack`](https://github.com/Dinaverse/local-ai-sovereign-stack) | Docker-based AI stack (Ollama + Grafana) |
| [`sovereign-lab-orchestration`](https://github.com/Dinaverse/sovereign-lab-orchestration) | Orchestration principles & IaC methodology |
| [`cybersecurity-lab-automation`](https://github.com/Dinaverse/cybersecurity-lab-automation) | Security automation & monitoring scripts |
| [`sovereign-ai-security`](https://github.com/Dinaverse/sovereign-ai-security) | AI-driven security tooling |

---

## ⚙️ Core Infrastructure Stack

```text
🐧 OS Layer        ::  Arch Linux, Kali Linux, Debian, Raspbian
🐳 Containers      ::  Docker, Docker Compose
🤖 AI Runtime      ::  Ollama (local LLM), CUDA, Multi-GPU VRAM pooling
📊 Monitoring      ::  Prometheus, Grafana, custom Python agents
🛡️ Security        ::  Suricata IDS, custom log analytics, Morpheus (AI SecOps)
🌐 Networking      ::  VLAN segmentation, custom DNS, SSH hardening
```

---

## 🏗️ Lab Topology
>>>>>>> temp-hardware/main

```
[Internet]
     │
<<<<<<< HEAD
  [Dell Gateway / Monitoring Node]
     │
  [Internal LAN]
     ├── [Kali Master Orchestrator & SecOps Hub]
     ├── [Arch GPU Compute Cluster]   ← 4x NVIDIA P106-100 / 24 GB VRAM
     ├── [Raspberry Pi IDS / DNS / Network Services]
     └── [AMD Canwork189 Storage & CPU Worker]
```

### Node Roles

| Node | OS | Primary Role |
|------|----|--------------|
| **Kali** | Kali Linux | Master orchestrator, SecOps, MCP Bridge |
| **Arch** | Arch Linux | GPU inference cluster Ollama + CUDA |
| **Raspberry Pi** | Raspbian | IDS (Suricata), DNS, network monitoring |
| **Dell** | Debian | Gateway, Grafana/Prometheus, uptime monitoring |
| **AMD Canwork189** | Ubuntu Server | Distributed storage, CPU-bound workloads |

---

## 🤖 AI Inference Layer

| Component | Details |
|-----------|---------|
| **Runtime** | Ollama (local, no cloud) |
| **Model** | Qwen 3.5:27B |
| **GPU Setup** | 4x NVIDIA P106-100 6 GB each = 24 GB VRAM total |
| **Framework** | CUDA multi-GPU with layer offloading |
| **Host OS** | Arch Linux (optimized kernel + DKMS) |

```mermaid
graph TD
    A[Inbound Inference Request] --> B(Ollama Load Balancer)
    B --> C[GPU 0: P106-100 6GB]
    B --> D[GPU 1: P106-100 6GB]
    B --> E[GPU 2: P106-100 6GB]
    B --> F[GPU 3: P106-100 6GB]
=======
  [Dell Gateway / Monitoring]
     │
  [LAN Switch]
     ├── [Kali Master Orchestrator]
     ├── [Arch GPU Cluster (4x P106-100)]
     ├── [Raspberry Pi IDS / DNS]
     └── [AMD Canwork189 Storage / CPU]
>>>>>>> temp-hardware/main
```

---

<<<<<<< HEAD
## 📊 Monitoring & Observability

- **Grafana** Real-time dashboards for GPU metrics, system health, network traffic
- **Prometheus** Metrics collection across all nodes
- **Suricata IDS** Network intrusion detection on Raspberry Pi node
- **Custom Python Agents** Host-level log analytics and anomaly detection

---

## 🛡️ Security Architecture

- SSH key-based authentication across all nodes
- VLAN segmentation for service isolation
- MCP Bridge on Kali for direct security tool execution via AI agent
- AI-driven threat detection via NVIDIA Morpheus pipeline

---

## 🔗 Related Repositories

| Repository | Role |
|------------|------|
| [`arch-linux-multi-gpu-llm`](https://github.com/Dinaverse/arch-linux-multi-gpu-llm) | GPU cluster deep-dive |
| [`local-ai-sovereign-stack`](https://github.com/Dinaverse/local-ai-sovereign-stack) | Docker AI stack |
| [`sovereign-lab-orchestration`](https://github.com/Dinaverse/sovereign-lab-orchestration) | IaC & orchestration methodology |
| [`cybersecurity-lab-automation`](https://github.com/Dinaverse/cybersecurity-lab-automation) | Security automation |
| [`my-sovereign-lab`](https://github.com/Dinaverse/my-sovereign-lab) | Lab overview & node inventory |

---

## ✅ Operational Status

| Service | Status |
|---------|--------|
| 24 GB VRAM GPU Cluster (Qwen 3.5:27B) | ✅ Stable |
| Distributed Ollama Inference | ✅ Active |
| Grafana / Prometheus Stack | ✅ Active |
| Suricata IDS | ✅ Active |
| MCP Bridge (Kali) | ✅ Active |

---

*Sovereign by design every component runs locally, owned entirely.*
=======
## 📈 Status

| Service | Status |
|---------|--------|
| Multi-GPU LLM Inference (Qwen 3.5:27B) | ✅ Operational |
| Grafana / Prometheus Monitoring | ✅ Operational |
| Suricata IDS | ✅ Operational |
| Docker Containerized Services | ✅ Operational |
| n8n Workflow Automation | ✅ Operational |

---

*Built with a research-and-development mindset repurposing hardware, not renting cloud.*
>>>>>>> temp-hardware/main
