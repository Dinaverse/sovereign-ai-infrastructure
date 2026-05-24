# Lab Master Documentation

This document serves as the single source of truth for the laboratory infrastructure.

## 1. Infrastructure Overview
The laboratory is an interconnected network of five primary nodes, managed from the Kali Station.

| Host Name | Role | IP Address | Status |
| :--- | :--- | :--- | :--- |
| Kali Station | Orchestrator/Controller | Local | Online |
| Arch Cluster | Primary Agent Node/Compute | <ARCH_CLUSTER_IP> | Online |
| Raspberry Pi | Pi-hole/Network Services | <RASPBERRY_PI_IP> | Online |
| Dell Precision | Orchestrator/Monitoring | <DELL_PRECISION_IP> | Online (SSH:30022) |
| Canwork189 | Dedicated Storage/General | <CANWORK_IP> | Online |

## 2. Technical Solutions & Error Resolutions

### WSL2 Context Deadline Exceeded
Connection timeouts and "context deadline exceeded" errors when performing Docker operations in WSL2 on the Dell Precision orchestrator were resolved by:
1. Increasing RAM and CPU limits in `~/.wslconfig`.
2. Configuring Docker to use a local path for storage within WSL2 to minimize latency caused by the 9p filesystem mounting of the Windows host.

### Samsung SSD Recovery Procedure
Data corruption detected on the primary NVMe storage was resolved by:
1. Booting into a rescue environment.
2. Identifying bad sectors with `smartctl`.
3. Creating a secure image of the disk using `ddrescue` for data recovery.
4. Restoring data after hardware replacement and firmware repair.

## 3. Host Specifications

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

## 4. Agent Network (Arch Cluster - <ARCH_CLUSTER_IP>)
Agents are deployed in `~/agents/` and managed as background services.

| Agent | Function | Execution Method |
| :--- | :--- | :--- |
| Security-Ops | Log Monitoring/Analysis | Background Process (`python3`) |
| Net-Analyzer | Hourly OSINT/Recon | Background Loop (`time.sleep`) |
| R&D Agent | Fine-tuning/Training | Skeleton (Manual Trigger) |

## 5. Orchestrator & Monitoring (Dell Precision - <DELL_PRECISION_IP>)
- **Monitoring Stack:** Grafana/Prometheus (Docker-based).
- **Access:** SSH via Port 30022.
- **Persistence:** Managed via `docker-compose`.

## 6. Persistence & Automation
- **SSH Access:** All nodes configured for passwordless access via `~/.ssh/id_lab_master`.
- **Automation:** Agents operate via background persistent loops (`nohup` + `&`).
- **Configuration:** Stable settings enforced via `~/.ssh/config` (KeepAlive settings).
EOF
,file_path:
### MCP Server Initialisation
*   **Problème :** Échec de communication/initialisation du serveur MCP de sécurité.
*   **Solution :** Vérification de la configuration TypeScript, validation des permissions d'exécution des binaires du serveur, et synchronisation des chemins dans le registre des outils (`tool-registry.json`).
