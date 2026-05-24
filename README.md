# Sovereign AI Laboratory

## Network Nodes
- **Kali**: Master / Orchestrator
- **Arch**: GPU Cluster (4x P106-100)
- **Raspberry Pi**: IDS / Network Services
- **Dell**: Gateway / Monitoring
- **AMD Machine**: Canwork189 (Storage & CPU Worker)

## Operational Status
- **24GB VRAM GPU Cluster:** Stable local inference of Qwen 3.5:27B model.
- **Distributed Ollama:** High-performance inference backend.
- **Integrated Kali Toolkit:** Native software bridge (MCP Bridge) for direct security tool execution.
- **Monitoring & IDS:** Grafana/Prometheus stack and Intrusion Detection Systems are operational.

## Resolved Technical Issues
- **WSL2 Context Deadline:** Resolved by switching network mode to `nat` in `.wslconfig` and increasing allocated resources.
- **Samsung SSD Recovery:** Full data rescue procedure via `smartctl` and `ddrescue` on corrupted storage.
- **GPU Driver Communication:** Resolved via a complete rebuild of the DKMS stack and kernel/NVIDIA driver version alignment.

## Key Technical Highlights
- **Hardware Repurposing:** Transformed mining cards (P106-100) and recovered Dell stations into a high-precision sovereign compute infrastructure.
- **Sovereign Local AI:** Zero cloud dependency. Data processing, from inference to security logs, remains strictly confined to the local network.
- **Distributed Orchestration:** Extensive use of Docker and systemd to isolate services while ensuring persistence and automated restarts.
- **Resilience:** Documented architecture for recovery in case of system or hardware failure, including raw disk mapping for corrupted drives.
EOF
,file_path: