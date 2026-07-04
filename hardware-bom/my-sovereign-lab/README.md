# Lab Master Documentation

This repository serves as the single source of truth for the laboratory infrastructure.

## 🏠 Professional Landing Page
For my professional biography, engineering focus, and portfolio overview, please visit my primary landing page: [Dinaverse Repository](https://github.com/Dinaverse/Dinaverse)

## 1. Infrastructure Overview
The laboratory is an interconnected network of five primary nodes, managed from the Kali Station.

| Host Name | Role | IP Address | Status |
| :--- | :--- | :--- | :--- |
| Kali Station | Orchestrator/Controller | Local | Online |
| Arch Cluster | Primary Agent Node/Compute | <ARCH_CLUSTER_IP> | Online |
| Raspberry Pi | Pi-hole/Network Services | <RASPBERRY_PI_IP> | Online |
| Dell Precision | Orchestrator/Monitoring | <DELL_PRECISION_IP> | Online |
| Canwork189 | Dedicated Storage/General | <CANWORK_IP> | Online |

## 2. Host Specifications

### Kali Station (Local)
- **CPU:** Intel Xeon E5-2630 v4 @ 2.20GHz
- **RAM:** 62 GiB
- **Storage:** 909 GiB total

### Arch Cluster (<ARCH_CLUSTER_IP>)
- **CPU:** Intel Core i5-6500 @ 3.20GHz
- **RAM:** 15 GiB
- **Storage:** 119 GiB total

### Raspberry Pi (<RASPBERRY_PI_IP>)
- **CPU:** Cortex-A53
- **RAM:** ~1 GiB
- **Storage:** 29 GiB total

### Canwork189 (<CANWORK_IP>)
- **CPU:** AMD FX-8320 Eight-Core Processor
- **RAM:** 7.2 GiB
- **Storage:** 46 GiB root, 159 GiB /local partition

## 3. Agent Network (Arch Cluster - <ARCH_CLUSTER_IP>)
Agents are deployed in `~/agents/` and managed as background services.

| Agent | Function | Execution Method |
| :--- | :--- | :--- |
| Security-Ops | Log Monitoring/Analysis | Background Process (`python3`) |
| Net-Analyzer | Hourly OSINT/Recon | Background Loop (`time.sleep`) |
| R&D Agent | Fine-tuning/Training | Skeleton (Manual Trigger) |

## 4. Orchestrator & Monitoring (Dell Precision - <DELL_PRECISION_IP>)
- **Monitoring Stack:** Grafana/Prometheus (Docker-based).
- **Access:** SSH via Port 30022.
- **Persistence:** Managed via `docker-compose`.
- **Status:** Deployment triggered via `docker-compose up -d`.

## 5. Persistence & Automation
- **SSH Access:** All nodes configured for passwordless access via `~/.ssh/id_lab_master`.
- **Automation:** Agents operate via background persistent loops (`nohup` + `&`).
- **Configuration:** Stable settings enforced via `~/.ssh/config` (KeepAlive settings).

---

## 🛡️ Security & Hardening
For detailed information on the methodologies used to secure the laboratory's remote access and network topology, please refer to the **[SSH & Network Security Procedure](SECURITY_PROCEDURES.md)**.

## 📊 Laboratory Reports
- **[Comprehensive Final Report (June 2026)](docs/LAB_COMPREHENSIVE_FINAL_REPORT.md)**: Synthesis of infrastructure migration and security hardening status.
- **[Operations & Security Reference](docs/LAB_OPERATIONS_REFERENCE.md)**: Technical protocols for lab maintenance and security.
- **[Syncthing Troubleshooting](docs/SYNCTHING_TROUBLESHOOTING.md)**: Procedures for resolving remote access issues via SSH tunneling.

---
*Always building, breaking, fixing, and documenting.*
