# 🏗️ Sovereign AI Infrastructure

> *Centralized architecture documentation for a distributed, cloud-agnostic AI and security laboratory - engineered for resilience, privacy, and bare-metal performance.*

---

## 🎯 Overview

This repository is the **single source of truth** for the architecture and operational design of my sovereign computing lab. It documents the multi-node topology, hardware specifications, software stack, and cross-service integration patterns across all nodes.

---

## 🖥️ Node Architecture

### Topology

```
[Internet]
     │
  [Dell - Gateway / Monitoring Node]
     │
  [Internal LAN]
     ├── [Kali - Master Orchestrator & SecOps Hub]
     ├── [Arch - GPU Compute Cluster]   ← 4x NVIDIA P106-100 / 24 GB VRAM
     ├── [Raspberry Pi - IDS / DNS / Network Services]
     └── [AMD Canwork189 - Storage & CPU Worker]
```

### Node Roles

| Node | OS | Primary Role |
|------|----|--------------|
| **Kali** | Kali Linux | Master orchestrator, SecOps, MCP Bridge |
| **Arch** | Arch Linux | GPU inference cluster - Ollama + CUDA |
| **Raspberry Pi** | Raspbian | IDS (Suricata), DNS, network monitoring |
| **Dell** | Debian | Gateway, Grafana/Prometheus, uptime monitoring |
| **AMD Canwork189** | Ubuntu Server | Distributed storage, CPU-bound workloads |

---

## 🤖 AI Inference Layer

| Component | Details |
|-----------|---------|
| **Runtime** | Ollama (local, no cloud) |
| **Model** | Qwen 3.5:27B |
| **GPU Setup** | 4x NVIDIA P106-100 - 6 GB each = 24 GB VRAM total |
| **Framework** | CUDA multi-GPU with layer offloading |
| **Host OS** | Arch Linux (optimized kernel + DKMS) |

```mermaid
graph TD
    A[Inbound Inference Request] --> B(Ollama Load Balancer)
    B --> C[GPU 0: P106-100 - 6GB]
    B --> D[GPU 1: P106-100 - 6GB]
    B --> E[GPU 2: P106-100 - 6GB]
    B --> F[GPU 3: P106-100 - 6GB]
```

---

## 📊 Monitoring & Observability

- **Grafana** - Real-time dashboards for GPU metrics, system health, network traffic
- **Prometheus** - Metrics collection across all nodes
- **Suricata IDS** - Network intrusion detection on Raspberry Pi node
- **Custom Python Agents** - Host-level log analytics and anomaly detection

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

*Sovereign by design - every component runs locally, owned entirely.*
