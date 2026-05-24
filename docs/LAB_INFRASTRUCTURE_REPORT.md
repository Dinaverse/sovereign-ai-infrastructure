# 📑 GLOBAL INFRASTRUCTURE & LAB SPECIFICATIONS REPORT

## 1. HARDWARE INVENTORY (HARDWARE REPURPOSING)

Your lab is a model of ingenuity, converting enterprise hardware, virtualization, and mining gear into a distributed and offensive compute infrastructure.

### 🖥️ Node 1: Inference Cluster (Headless)
*   **OS:** Arch Linux (Optimized with **Linux-Zen** Kernel)
*   **CPU:** Intel Core i5-6500 (4 Cores / 4 Threads) @ 3.20GHz
*   **RAM:** 16GB DDR4 (Protected against saturation by **ZRAM** using zstd)
*   **GPU:** 4x NVIDIA P106-100 (6GB GDDR5 each = **24GB total VRAM**)
*   **Display:** Intel HD Graphics 530 (used for local display to free NVIDIA GPUs for CUDA).
*   **AI Model:** Qwen 3.5:27B (17GB - fits entirely in VRAM).
*   **Repurposing Note:** Legacy mining cards, lacking physical video outputs, repurposed here as pure CUDA compute accelerators.

### 🏗️ Node 2: Development Station (Dell Precision)
*   **OS:** Windows 11 Pro + WSL2 (Ubuntu 24.04.4 LTS / Kernel 6.6.114)
*   **WSL IP:** <INTERNAL_IP>/20 (Stable NAT mode)
*   **Chassis / Model:** Dell Precision Tower 5810
*   **CPU:** Intel Xeon E5-1603 v3 (4 Cores / 4 Threads) @ 2.80GHz
*   **RAM:** 32GB installed
*   **GPU:** NVIDIA GeForce GTX 1060 (6GB VRAM)
*   **Storage:** 
    *   1TB ext4 primary Linux partition.
    *   13 Windows partitions mounted via 9p protocol.
*   **Primary Role:** Development environment, orchestration (Docker, OpenClaw), and massive storage.

### 💻 Node 3: Kali Linux Station (Native Host)
*   **OS:** Kali GNU/Linux Rolling (Native, Kernel 6.19.14)
*   **GUI:** KDE Plasma 6.5.4 (KWin via Wayland)
*   **CPU:** Dual-processor configuration (2 x Intel Xeon CPU)
*   **RAM:** 64GB
*   **GPU:** NVIDIA GeForce GTX 1060
*   **Storage:** 1TB Disk
*   **Primary Role:** Elite offensive lab (Pentest), natively hosting your security toolkit (28 major tools).

---

## 2. VALIDATED BLUEPRINTS & CONFIGURATIONS

### A. AI Blueprint (Arch Linux) — Success ✅
*   **NVIDIA Headless Optimization:** Forced module loading via `mkinitcpio.conf`: `MODULES=(intel_agp i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm)`.
*   **GRUB Config:** Used `nvidia-drm.modeset=1` for correct initialization.
*   **GPU Persistence:** Enabled `nvidia-persistenced` to eliminate request latency.
*   **Multi-GPU Inference:** Ollama leverages CUDA to partition Qwen 3.5:27B across the 24GB VRAM.

### B. System Recovery Plan (External SSD & WSL) — Success ✅
*   **WSL Network Resolution:** Fixed `context deadline exceeded` error via `.wslconfig` (switched from `mirrored` to `nat` mode).
*   **Hot Recovery:** Direct mounting of corrupted Samsung 256GB SSD in WSL to modify `sources.list`, downgrade `libpulse0`, and reinstall the graphical environment (`gdm3`, `ubuntu-desktop`).
*   **Hybrid VirtualBox VM:** Used `VBoxManage internalcommands createrawvmdk` to run the physical SSD as a VM under Windows, with ONLINE/OFFLINE switch protocol.

---

## 3. SOFTWARE ARCHITECTURE & AUTONOMY STRATEGY

Your ecosystem is designed for absolute privacy and maximum performance:

1.  **User Interface (Open WebUI):** Orchestrated via OpenClaw in Docker (WSL2 on Dell Precision).
2.  **Inference Engine (Ollama):** Manages models (Qwen 3.5 27B, Qwen 2.5 Coder 14B, Llama3).
    *   *Optimization:* Systematic use of Q4_K_M quantized variants for optimal performance/VRAM ratio.
3.  **Native Execution Layer (Native Bridge / MCP):** 
    *   **MCP Server:** `mcp-security-server.js` using `child_process`.
    *   **Python Bridge:** Uses `subprocess` to call Kali tools.
    *   **Security:** Strict recommendation to avoid `shell=True` and use argument lists to prevent command injection.
    *   **Resource Management:** `ai-stop` alias and `openclaw.service` systemd service to purge RAM.

---

## 4. PROJECT DIRECTION & EVOLUTION (TARGET NETWORK)

Final goal is total LAN interconnection:
1.  **Remote Ollama:** Configure Ollama on the Arch cluster (`OLLAMA_HOST=<INTERNAL_IP>`) to serve the local network.
2.  **Centralized Orchestration:** Link Open WebUI on Dell Precision (32GB RAM) to Arch compute brain (24GB VRAM) and Kali offensive capabilities (64GB RAM).
3.  **GitHub Portfolio:** Highlighting "Secure Zone Analysis," "User Filtering," and the multi-GPU optimization guide.
EOF
,file_path: