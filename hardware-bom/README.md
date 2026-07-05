# 🧪 Hardware Bill of Materials (BOM) — Sovereign Lab

> *Complete hardware inventory and specifications for the distributed, self-hosted AI and security laboratory.*

---

## 🎯 Purpose

This directory documents the physical infrastructure of the sovereign lab — detailed hardware specifications, component BOM, and procurement records for the 5-node distributed system.

---

## 🖥️ Node Inventory

| Node | Hostname | Role | CPU | RAM | Storage | GPU |
|------|----------|------|-----|-----|---------|-----|
| 🧠 | **Arch-GPU** | GPU Compute / LLM Inference | Intel i5-6500 @ 3.2GHz | 16 GiB | 119 GiB | 4× NVIDIA P106-100 (24 GB) |
| 🔴 | **Kali-Master** | Orchestrator / SecOps Hub | Intel Xeon E5-2630 v4 @ 2.2GHz | 62 GiB | 909 GiB | None (x86) |
| 🥧 | **Raspberry-Pi** | IDS / DNS / Network Services | ARM Cortex-A53 | ~1 GiB | 29 GiB | None (ARM) |
| 🖧 | **Dell-Gateway** | Gateway / Monitoring | x86 server-class | 32 GiB | 500 GiB | None |
| 💾 | **AMD-Storage** | Storage / CPU Compute | AMD FX-8320 (8-core) | 7.2 GiB | 46 GiB + 159 GiB /local | None |

---

## 📋 Hardware Bill of Materials (BOM)

### GPU Compute Node (Arch-GPU)

**Purpose:** Local LLM inference with multi-GPU acceleration (Qwen 3.5:27B)

```
├── CPU           : Intel Core i5-6500 (4 cores / 4 threads @ 3.2GHz)
├── Motherboard   : Intel B150 chipset LGA1151
├── RAM           : 16 GB DDR4 2133 MHz (2× 8GB)
├── Storage       : 119 GB SSD (Btrfs filesystem)
├── PSU           : 1200W 80+ Gold (supports 4× GPUs)
├── Cooling       : Noctua NH-D15 tower cooler
└── GPUs (4×)     :
    ├── NVIDIA P106-100 (6 GB GDDR5 each)
    ├── NVIDIA P106-100
    ├── NVIDIA P106-100
    └── NVIDIA P106-100
       Total GPU VRAM: 24 GB
       CUDA Compute Capability: 6.1
```

### Master Orchestrator (Kali-Master)

**Purpose:** Autonomous agent orchestration, security operations hub, MCP bridge

```
├── CPU           : Intel Xeon E5-2630 v4 (10 cores @ 2.2GHz)
├── Motherboard   : Intel C610 chipset LGA2011-3
├── RAM           : 62 GB DDR4 2133 MHz
├── Storage       : 909 GB total (mixed SSD + HDD)
├── PSU           : 500W redundant 80+ Platinum
├── Cooling       : Active server-grade cooler
├── OS            : Kali Linux (latest)
└── Services      :
    ├── Security-Ops Agent (log monitoring)
    ├── Net-Analyzer Agent (recon)
    ├── MCP Bridge (AI integration)
    └── NVIDIA Morpheus (AI SecOps)
```

### IDS / Network Services (Raspberry-Pi)

**Purpose:** Network intrusion detection, DNS, network monitoring

```
├── CPU           : ARM Cortex-A53 (Broadcom BCM2835)
├── RAM           : 1-4 GiB LPDDR4
├── Storage       : 29 GiB microSD + external USB
├── PSU           : 5V 3A USB-C
├── Cooling       : Passive (heatsink)
├── OS            : Raspbian
└── Services      :
    ├── Suricata IDS
    ├── Dnsmasq (DNS)
    └── Network monitoring agents
```

### Gateway & Monitoring (Dell-Gateway)

**Purpose:** Internet gateway, Prometheus/Grafana monitoring hub

```
├── CPU           : x86 server-class processor
├── RAM           : 32 GB DDR4
├── Storage       : 500 GB SSD
├── PSU           : Enterprise-grade redundant
├── Cooling       : Integrated server cooling
├── OS            : Debian / Ubuntu Server
└── Services      :
    ├── Prometheus (metrics collection)
    ├── Grafana (dashboards)
    ├── Node Exporter
    └── Networking stack
```

### Storage & CPU Compute (AMD-Storage)

**Purpose:** Distributed storage, CPU-intensive workloads

```
├── CPU           : AMD FX-8320 (8-core @ 3.5GHz)
├── Motherboard   : AMD 990FX chipset
├── RAM           : 7.2 GB DDR3 1600 MHz
├── Storage       : 46 GB (internal) + 159 GB (/local SSD)
├── PSU           : 850W 80+ Bronze
├── Cooling       : Tower air cooler
├── OS            : Ubuntu Server 22.04 LTS
└── Services      :
    ├── Network file storage (NFS)
    ├── CPU-bound analytics
    └── Backup/archive
```

---

## 🌐 Network Topology

```
                    ┌─────────────────────┐
                    │ Internet Connection │
                    └──────────┬──────────┘
                               │
                    ┌──────────▼──────────┐
                    │  Dell-Gateway      │
                    │  (Monitoring Hub)  │
                    │  Prometheus/Grafana│
                    └──────────┬──────────┘
                               │
                    ┌──────────▼──────────────────────────────────────┐
                    │         Internal LAN (192.168.x.0/24)           │
                    └────┬────────────────────────────────────────┬───┘
                         │                                        │
        ┌────────────────▼────────────────┐    ┌────────────────▼────────────────┐
        │    Kali-Master Orchestrator    │    │   Arch-GPU (Compute Node)      │
        │    ├── Security-Ops Agent      │    │   ├── Ollama (LLM runtime)     │
        │    ├── Net-Analyzer Agent      │    │   ├── 4× NVIDIA P106-100 GPUs  │
        │    ├── MCP Bridge              │    │   └── CUDA 11.8 / cuDNN        │
        │    └── NVIDIA Morpheus         │    └────────────────┬───────────────┘
        └────────────────┬────────────────┘                    │
                         │                                     │
        ┌────────────────▼────────────────┐    ┌──────────────▼──────────────┐
        │   Raspberry-Pi (IDS)            │    │  AMD-Storage (Storage/CPU)  │
        │   ├── Suricata IDS              │    │  ├── NFS Storage            │
        │   ├── DNS Services              │    │  ├── CPU Analytics          │
        │   └── Network Monitoring        │    │  └── Archive Services       │
        └────────────────┬────────────────┘    └──────────────┬──────────────┘
                         │                                    │
                         └────────────────┬───────────────────┘
                                          │
                              (Inter-node networking via SSH/systemd)
```

---

## 💰 Cost & Procurement

### Salvage / Repurposing

| Component | Source | Cost | Notes |
|-----------|--------|------|-------|
| GPU Cards (4×) | Salvage / Bulk purchase | €60-90 each | NVIDIA P106-100, datacenter surplus |
| Server hardware | Enterprise surplus | €100-200 | Dell, Supermicro servers |
| RAM modules | Recycled hardware | €10-30 each | DDR4 / DDR3 mixed sources |
| Storage drives | Mixed sources | €20-50 each | SSD + HDD mix |

**Total Lab Cost:** ~€2,500-4,000 (salvaged/repurposed hardware at fraction of new cost)

---

## 📊 Performance Specs

| Metric | Value | Purpose |
|--------|-------|---------|
| **Total VRAM** | 24 GB | Qwen 3.5:27B LLM inference |
| **Total RAM** | 126+ GB | Multi-service operation |
| **Total Cores** | 22+ | Distributed processing |
| **Network** | Gigabit LAN | Inter-node communication |
| **Storage** | 2+ TB | Logs, models, data |

---

## 🔗 Related Repositories

- [sovereign-ai-infrastructure](https://github.com/Dinaverse/sovereign-ai-infrastructure) — Main architecture docs
- [arch-linux-multi-gpu-llm](https://github.com/Dinaverse/arch-linux-multi-gpu-llm) — GPU optimization guide
- [local-ai-sovereign-stack](https://github.com/Dinaverse/local-ai-sovereign-stack) — Docker stack

---

*Sovereignty through ownership. Performance through optimization. Value through revalorization.*
