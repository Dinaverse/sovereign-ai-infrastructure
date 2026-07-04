# 👋 Welcome to My Engineering Lab

<div align="center">

**Infrastructure Engineer | Security Specialist | AI Systems Builder**

[![Profile Views](https://komarev.com/ghpvc/?username=yourusername&color=brightgreen)](https://github.com/yourusername)
[![Repos](https://img.shields.io/badge/Repositories-5-blue)](#featured-projects)
[![Python](https://img.shields.io/badge/Python-Expert-3776ab?logo=python&logoColor=fff)](.)
[![Security](https://img.shields.io/badge/Cybersecurity-Advanced-red)](.)
[![Infrastructure](https://img.shields.io/badge/Infrastructure-IaC-important)](.)

</div>

---

## 🚀 About Me

I'm an **infrastructure engineer & cybersecurity specialist** with a decade of passion for self-directed engineering, combining hands-on technical exploration with formal infrastructure training. I specialize in:

- 🖥️ **Multi-GPU AI Infrastructure** - Designing and optimizing high-performance LLM inference systems
- 🛡️ **Cybersecurity & Penetration Testing** - Building automation frameworks and security analysis tools
- 🏗️ **Infrastructure as Code** - Reproducible, enterprise-grade system deployment
- 🐍 **Security Analytics** - Python-based threat detection and data analysis
- ☁️ **Sovereign AI** - Privacy-first, cloud-independent AI stacks

**Current Focus**: Building production-grade infrastructure for local AI inference with complete autonomy and zero cloud dependencies.

---

## 🏆 Featured Projects

### 1. **[arch-linux-multi-gpu-llm](https://github.com/yourusername/arch-linux-multi-gpu-llm)** ⭐⭐⭐⭐⭐
**4x NVIDIA P106 GPU Cluster + Qwen 3.5:27B LLM**

Deploy and optimize a complete multi-GPU inference system on Arch Linux with comprehensive guides for driver installation, kernel optimization, and performance tuning.

- 4x NVIDIA P106-100 (24GB total VRAM)
- Qwen 3.5:27B model (17GB - fully in VRAM)
- Complete troubleshooting guide
- Performance benchmarks & optimization techniques

```bash
# Quick deploy
./deploy-arch-cluster.sh
# Verify: nvidia-smi && ollama run qwen3.5:27b
```

**Tech Stack**: Arch Linux, NVIDIA CUDA, Ollama, Linux Kernel

[![Open in GitHub](https://img.shields.io/badge/Open%20in%20GitHub-181717?logo=github&logoColor=fff)](https://github.com/yourusername/arch-linux-multi-gpu-llm)

---

### 2. **[cybersecurity-lab-automation](https://github.com/yourusername/cybersecurity-lab-automation)** ⭐⭐⭐⭐
**Complete Security Toolkit with Native MCP Bridge**

Integrated 28 Kali security tools with Python analytics for real-world penetration testing and threat detection. Features native execution architecture (zero Docker overhead) with custom security analysis modules.

**Key Features**:
- Failed login detection (brute force)
- Session duration anomaly detection
- Security zone coverage analysis
- Native MCP bridge for seamless tool integration
- Production-ready alerting system

**Integrated Tools**: nmap, sqlmap, hydra, metasploit, burpsuite, nikto, and 22 more

```bash
# Run security analysis
python failed-login-analysis/brute_force_detector.py --logfile auth.log
python session-duration-analysis/anomaly_detector.py
```

**Tech Stack**: Python, Kali Linux, MCP, Node.js

[![Open in GitHub](https://img.shields.io/badge/Open%20in%20GitHub-181717?logo=github&logoColor=fff)](https://github.com/yourusername/cybersecurity-lab-automation)

---

### 3. **[local-ai-sovereign-stack](https://github.com/yourusername/local-ai-sovereign-stack)** ⭐⭐⭐⭐⭐
**Complete Autonomous AI Infrastructure with Zero Cloud Dependencies**

Three-machine distributed AI system with Ollama inference engine, Open WebUI interface, and native security tool integration. Demonstrates enterprise-grade infrastructure patterns.

**Architecture**:
- Machine 1 (Arch): 4x GPU inference cluster
- Machine 2 (Dell): 32GB gateway + orchestration
- Machine 3 (Kali): 64GB security operations

**Features**:
- Multi-GPU inference distribution
- Web-based Claude-like interface
- 28 integrated security tools
- Complete deployment automation
- Disaster recovery procedures

```bash
# Deploy entire stack
./deploy-all.sh
# Access: http://gateway-machine:8080
```

**Tech Stack**: Ollama, Open WebUI, OpenClaw, Docker, Python

[![Open in GitHub](https://img.shields.io/badge/Open%20in%20GitHub-181717?logo=github&logoColor=fff)](https://github.com/yourusername/local-ai-sovereign-stack)

---

### 4. **[python-security-analytics](https://github.com/yourusername/python-security-analytics)** ⭐⭐⭐⭐
**40+ Security Analysis Scripts for Network & Application Analysis**

Comprehensive collection of Python projects demonstrating security fundamentals, data analysis, and threat detection. From cryptography basics to advanced anomaly detection.

**Project Categories**:
- Security zone analysis (geometric coverage)
- Failed login detection (brute force)
- Session duration anomaly detection
- Cryptography fundamentals
- Network analysis & packet inspection
- Access control systems
- 7 hands-on practical labs
- Data analysis & reporting

```bash
# Run lab examples
python 01-security-zone-analysis/example_scenarios.py
python 02-failed-login-analysis/brute_force_detector.py
python 07-laboratory/lab_01_password_strength.py
```

**Tech Stack**: Python, Pandas, scikit-learn, Matplotlib, Scapy

[![Open in GitHub](https://img.shields.io/badge/Open%20in%20GitHub-181717?logo=github&logoColor=fff)](https://github.com/yourusername/python-security-analytics)

---

### 5. **[infrastructure-as-code-lab](https://github.com/yourusername/infrastructure-as-code-lab)** ⭐⭐⭐
**Complete IaC Framework for Three-Machine Distributed Lab**

Enterprise-grade infrastructure definitions enabling you to rebuild the entire lab from scratch. Includes automated deployment scripts, configuration management, and disaster recovery procedures.

**Components**:
- System setup automation (all 3 machines)
- GRUB bootloader configuration
- NVIDIA driver stack installation
- systemd service definitions
- Docker Compose orchestration
- WSL2 configuration
- Network setup & firewall
- Health monitoring & benchmarks
- Automated backup & recovery
- Security hardening

```bash
# Deploy everything at once
./deploy-all.sh --all-machines

# Or deploy individually
./deploy-arch-cluster.sh
./deploy-gateway.sh
./deploy-security-lab.sh
```

**Tech Stack**: Bash, systemd, Docker, YAML, IaC Best Practices

[![Open in GitHub](https://img.shields.io/badge/Open%20in%20GitHub-181717?logo=github&logoColor=fff)](https://github.com/yourusername/infrastructure-as-code-lab)

---

## 💻 Hardware Setup

### Lab Infrastructure

```
┌─────────────────────────────────────────────────┐
│ MACHINE 1: Arch Linux Inference Cluster         │
│ • Intel i5-6500 (4C/4T)                         │
│ • 16GB RAM + ZRAM compression                   │
│ • 4x NVIDIA P106-100 (24GB VRAM)               │
│ • Qwen 3.5:27B LLM                             │
└─────────────────────────────────────────────────┘
         ↓ Gigabit Network
┌─────────────────────────────────────────────────┐
│ MACHINE 2: Dell Precision (Windows 11 + WSL2)   │
│ • Intel Xeon E5-1603 v3 (4C/4T)                │
│ • 32GB RAM                                      │
│ • NVIDIA GTX 1060 (6GB)                        │
│ • Open WebUI + Orchestration                   │
└─────────────────────────────────────────────────┘
         ↓ Gigabit Network
┌─────────────────────────────────────────────────┐
│ MACHINE 3: Kali Linux (Native)                  │
│ • 2x Intel Xeon CPUs (24+ cores)               │
│ • 64GB RAM                                      │
│ • NVIDIA GTX 1060 (6GB)                        │
│ • 28 Security Tools + MCP Bridge               │
└─────────────────────────────────────────────────┘
```

**Total Compute**: 52GB RAM, 30GB VRAM, 28+ CPU cores, distributed AI inference

---

## 📊 Skills & Expertise

### Infrastructure & DevOps
- ![Arch Linux](https://img.shields.io/badge/Arch%20Linux-Expert-1793d1?logo=arch-linux&logoColor=fff)
- ![Linux](https://img.shields.io/badge/Linux%20Kernel-Advanced-FCC624?logo=linux&logoColor=fff)
- ![Docker](https://img.shields.io/badge/Docker-Advanced-2496ed?logo=docker&logoColor=fff)
- ![Bash](https://img.shields.io/badge/Bash%20Scripting-Expert-4EAA25?logo=gnu-bash&logoColor=fff)
- ![systemd](https://img.shields.io/badge/systemd-Advanced-FD7E14)
- ![IaC](https://img.shields.io/badge/Infrastructure%20as%20Code-Advanced-important)

### AI & GPU Computing
- ![NVIDIA CUDA](https://img.shields.io/badge/NVIDIA%20CUDA-Advanced-76b900?logo=nvidia)
- ![Ollama](https://img.shields.io/badge/Ollama%20LLM-Expert-purple)
- ![GPU Optimization](https://img.shields.io/badge/GPU%20Optimization-Advanced-green)
- ![Multi-GPU](https://img.shields.io/badge/Multi%20GPU%20Systems-Advanced-green)

### Security & Penetration Testing
- ![Kali Linux](https://img.shields.io/badge/Kali%20Linux-Advanced-557C94?logo=kali-linux&logoColor=fff)
- ![Penetration Testing](https://img.shields.io/badge/Penetration%20Testing-Advanced-red)
- ![Network Security](https://img.shields.io/badge/Network%20Security-Advanced-red)
- ![Cryptography](https://img.shields.io/badge/Cryptography-Advanced-blue)

### Programming Languages
- ![Python](https://img.shields.io/badge/Python-Expert-3776ab?logo=python&logoColor=fff)
- ![Bash](https://img.shields.io/badge/Bash-Expert-4EAA25?logo=gnu-bash&logoColor=fff)
- ![JavaScript](https://img.shields.io/badge/JavaScript-Advanced-F7DF1E?logo=javascript&logoColor=fff)
- ![TypeScript](https://img.shields.io/badge/TypeScript-Intermediate-3178C6?logo=typescript&logoColor=fff)

---

## 📈 GitHub Statistics

<div align="center">

![GitHub Stats](https://github-readme-stats.vercel.app/api?username=yourusername&show_icons=true&theme=dark)

![Top Languages](https://github-readme-stats.vercel.app/api/top-langs/?username=yourusername&layout=compact&theme=dark)

</div>

---

## 🎓 Education & Certifications

**Currently**: DEC (Diploma of College Studies) in Infrastructure & Cybersecurity (LEA.XX)
- **Institution**: Collège de Bois-de-Boulogne, Montréal
- **Current Performance**: 90.8% average (First Session)
- **Focus**: Infrastructure optimization, GPU computing, security automation

**Autodidact Since Age 10**: 10+ years of hands-on infrastructure and security learning

---

## 📚 Recent Blog Posts & Articles

- **[Building a Sovereign AI Stack](https://example.com)** - Complete guide to local LLM infrastructure
- **[GPU Cluster Optimization on Arch Linux](https://example.com)** - Performance tuning for multi-GPU systems
- **[Native MCP Bridge Architecture](https://example.com)** - Seamless tool integration without containers
- **[Cybersecurity Automation Best Practices](https://example.com)** - Enterprise security workflows

---

## 🔗 Let's Connect

<div align="center">

[![Email](https://img.shields.io/badge/Email-Contact%20Me-EA4335?logo=gmail&logoColor=fff)](mailto:your.email@example.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-0A66C2?logo=linkedin&logoColor=fff)](https://linkedin.com/in/yourprofile)
[![Twitter](https://img.shields.io/badge/Twitter-Follow-1DA1F2?logo=twitter&logoColor=fff)](https://twitter.com/yourhandle)
[![Discord](https://img.shields.io/badge/Discord-Join-5865F2?logo=discord&logoColor=fff)](discord.gg/yourserver)

</div>

---

## 💡 What I'm Currently Working On

- 🚀 **Distributed AI Inference** - Scaling inference across multiple GPU clusters
- 🔒 **Security Automation** - Building advanced threat detection systems
- 📊 **Real-time Monitoring** - Creating observability stacks for infrastructure
- 🧠 **AI Fine-tuning** - Custom model optimization for specific tasks

---

## 🎯 Open to Opportunities

- **Infrastructure Engineering** roles
- **Security Operations** positions
- **DevOps & Platform Engineering** teams
- **AI/ML Infrastructure** projects

**Interested in collaborating?** Drop me a message!

---

<div align="center">

### ⭐ If you find these projects useful, please consider giving them a star!

**Built with ❤️ in Montréal**

![Visitors](https://visitor-badge.laobi.icu/badge?page_id=yourusername.yourusername)

</div>

---

## 📄 License

All repositories are MIT Licensed - Feel free to use and adapt for your projects.

---

**Last Updated**: May 2026 | **Status**: ✅ Actively Maintaining | **Next Update**: June 2026
