# 🧪 Hardware Bill of Materials (BOM) — Sovereign Lab

> *Complete hardware inventory and specifications for the distributed, self-hosted AI and security laboratory.*

---

## 🎯 Purpose

This directory documents the physical infrastructure of the sovereign lab — detailed hardware specifications, component BOM, and procurement records for the 5-node distributed system.

---

## 🖥️ Node Inventory

| Node | Hostname | Role | CPU | RAM | Storage | GPU |
|------|----------|------|-----|-----|---------|-----|
| 🧠 | **Arch-GPU** | GPU Compute / LLM Inference | Intel i5-6500 @ 3.2GHz | 15 GiB | 119 GiB | 4× NVIDIA P106-100 (24 GB) |
| 🔴 | **Kali-Master** | Orchestrator / SecOps Hub | Intel Xeon E5-2630 v4 @ 2.2GHz | 62 GiB | 909 GiB | None (x86) |
| 🥧 | **Raspberry-Pi** | IDS / DNS / Network Services | ARM Cortex-A53 | ~1 GiB | 29 GiB | None (ARM) |
| 🖧 | **Dell-Gateway** | Gateway / Monitoring | x86 server-class | 32 GiB | 500 GiB | None |
| 💾 | **AMD-Storage** | Storage / CPU Compute | AMD FX-8320 (8-core) | 7.2 GiB | 46 GiB + 159 GiB /local | None |

---

## 📋 Hardware Bill of Materials (BOM)

### GPU Compute Node (Arch-GPU)
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
```
├── CPU           : Intel Xeon E5-2630 v4 (10 cores @ 2.2GHz)
├── Motherboard   : Intel C610 chipset LGA2011-3
├── RAM           : 62 GB DDR4 2133 MHz
├── Storage       : 909 GB total (mixed SSD + HDD)
├── PSU           : 500W redundant 80+ Platinum
├── Network       : 10 Gbps Ethernet (iLO remote access)
└── Cooling       : Enterprise liquid cooling
```

### Raspberry Pi (Network Services)
```
├── SoC           : Broadcom BCM2837 (ARM Cortex-A53, 4 cores)
├── RAM           : 1 GB LPDDR2
├── Storage       : 29 GB microSD card (Class 10)
├── Network       : Gigabit Ethernet
└── PSU           : 5V 2.5A USB-C
```

### Dell Gateway (Monitoring)
```
├── CPU           : x86 server-class processor
├── RAM           : 32 GB DDR4 ECC
├── Storage       : 500 GB enterprise SSD
├── PSU           : Enterprise 650W
├── Network       : 1 Gbps × 2 (redundant)
└── Remote Access : iLO / Lights-Out Management
```

### AMD Storage Node (Canwork189)
```
├── CPU           : AMD FX-8320 Eight-Core Processor @ 3.5GHz
├── Motherboard   : AMD 970 chipset
├── RAM           : 7.2 GB DDR3 1600 MHz
├── Storage       : 46 GB root + 159 GB /local partition
├── PSU           : 500W
└── Cooling       : Standard tower cooler
```

---

## 🔌 Networking

```
[Internet]
    ↓
[Dell Gateway / Firewall]
    ↓
[Internal LAN (192.168.x.0/24)]
    ├── Kali-Master (Orchestrator)
    ├── Arch-GPU (Compute)
    ├── Raspberry-Pi (IDS / DNS)
    └── AMD-Storage (NAS)

[Remote Access]
    └── SSH Hardening + Tailscale VPN
```

---

## 📊 Total System Specifications

| Metric | Value |
|--------|-------|
| **Total CPU Cores** | 30+ cores (mixed x86 + ARM) |
| **Total RAM** | 117 GiB |
| **Total Storage** | 1.7 TB |
| **GPU VRAM** | 24 GB (4× P106-100) |
| **Total Power** | ~3500W under load |
| **Network** | 10 Gbps + 1 Gbps redundancy |

---

## 🔗 Related Documentation

- **Main Infrastructure Repo:** [sovereign-ai-infrastructure](../README.md)
- **Docker Hosting:** [docker-compose/](../docker-compose/README.md)
- **Lab Reference:** [my-sovereign-lab](https://github.com/Dinaverse/my-sovereign-lab)
- **Hardware Setup Guide:** [arch-linux-multi-gpu-llm](https://github.com/Dinaverse/arch-linux-multi-gpu-llm)

---

*Built from repurposed enterprise hardware. Engineered for resilience and performance.*