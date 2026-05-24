# 📑 RAPPORT GLOBAL D'INFRASTRUCTURE & SPÉCIFICATIONS LAB

## 1. INVENTAIRE MATÉRIEL DES 3 ORDINATEURS RECYCLÉS (HARDWARE REPURPOSING)

Votre laboratoire est un modèle d'ingéniosité, convertissant du matériel d'entreprise, de virtualisation et de minage en une infrastructure de calcul distribuée et offensive.

### 🖥️ Ordinateur 1 : Le Cluster d'Inférence (Headless)
*   **Système d'Exploitation :** Arch Linux (Optimisé avec le Kernel **Linux-Zen**)
*   **Processeur (CPU) :** Intel Core i5-6500 (4 Cœurs / 4 Threads) @ 3.20GHz
*   **Mémoire Vive (RAM) :** 16 Go DDR4 (Sécurisée contre la saturation par **ZRAM** compressé en zstd)
*   **Processeur Graphique (GPU) :** 4x NVIDIA P106-100 (6 Go GDDR5 chacune = **24 Go VRAM au total**)
*   **Affichage :** iGPU Intel HD Graphics 530 (utilisé pour l'affichage local afin de libérer les GPU NVIDIA pour CUDA).
*   **Modèle IA Cible :** Qwen 3.5:27B (17 Go - s'intègre entièrement dans la VRAM).
*   **Note de repurposing :** Anciennes cartes dédiées au minage de cryptomonnaies, dépourvues de sorties vidéo physiques, réutilisées ici comme accélérateurs de calcul CUDA purs.

### 🏗️ Ordinateur 2 : La Station de Développement (Dell Precision)
*   **Système d'Exploitation :** Windows 11 Pro + WSL2 (Ubuntu 24.04.4 LTS / Noyau 6.6.114)
*   **Adresse IP WSL :** 172.27.19.161/20 (Mode NAT stable)
*   **Châssis / Modèle :** Dell Precision Tower 5810
*   **Processeur (CPU) :** Intel Xeon E5-1603 v3 (4 Cœurs / 4 Threads) @ 2.80GHz
*   **Mémoire Vive (RAM) :** 32 Go de RAM installés
*   **Processeur Graphique (GPU) :** NVIDIA GeForce GTX 1060 (6 Go VRAM)
*   **Espace Stockage :** 
    *   Partition Linux principale ext4 de 1 To.
    *   Réseau de 13 partitions Windows montées via le protocole 9p.
*   **Rôle principal :** Environnement de développement, orchestration (Docker, OpenClaw) et stockage massif.

### 💻 Ordinateur 3 : La Station Kali Linux (Hôte Natif)
*   **Système d'Exploitation :** Kali GNU/Linux Rolling (Natif, Noyau 6.19.14)
*   **Environnement Graphique :** KDE Plasma 6.5.4 (KWin via Wayland)
*   **Processeur (CPU) :** Configuration Bi-Processeur (2 x Intel Xeon CPU)
*   **Mémoire Vive (RAM) :** 64 Go de RAM
*   **Processeur Graphique (GPU) :** NVIDIA GeForce GTX 1060
*   **Stockage :** Disque de 1 To
*   **Rôle principal :** Laboratoire offensif d'élite (Pentest) hébergeant nativement votre boîte à outils de sécurité (28 outils majeurs).

---

## 2. BLUEPRINTS ET RÉUSSITES DE CONFIGURATION VALIDÉES

### A. Le Blueprint de l'IA Locale (Arch Linux) — Réussi ✅
*   **Optimisation NVIDIA Headless :** Forçage du chargement des modules via `mkinitcpio.conf` : `MODULES=(intel_agp i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm)`. Le placement de `intel_agp` et `i915` en premier garantit l'utilisation de l'iGPU pour l'affichage.
*   **Configuration GRUB :** Utilisation de `nvidia-drm.modeset=1` pour l'initialisation correcte.
*   **Persistance GPU :** Activation de `nvidia-persistenced` pour éliminer la latence entre les requêtes.
*   **Inférence Multi-GPU :** Ollama exploite la pile CUDA pour partitionner Qwen 3.5:27B sur les 24 Go de VRAM.

### B. Le Plan de Sauvetage Système (SSD Externe & WSL) — Réussi ✅
*   **Résolution Réseau WSL :** Correction de l'erreur `context deadline exceeded` via `.wslconfig` (basculement du mode `mirrored` vers `nat`).
*   **Restauration à chaud :** Montage direct du SSD Samsung 256 Go corrompu dans WSL pour modification des `sources.list`, downgrade de `libpulse0` et réinstallation de l'environnement graphique (`gdm3`, `ubuntu-desktop`).
*   **VM Hybride VirtualBox :** Utilisation de `VBoxManage internalcommands createrawvmdk` pour exécuter le SSD physique en tant que VM sous Windows, avec protocole de bascule ONLINE/OFFLINE.

---

## 3. ARCHITECTURE LOGICIELLE ET STRATÉGIE D'AUTONOMIE

Votre écosystème est conçu pour une confidentialité absolue et une performance maximale :

1.  **Interface Utilisateur (Open WebUI) :** Orchestrée via OpenClaw dans Docker (WSL2 sur Dell Precision).
2.  **Moteur d'Inférence (Ollama) :** Gère les modèles (Qwen 3.5 27B, Qwen 2.5 Coder 14B, Llama3).
    *   *Optimisation :* Utilisation systématique des variantes quantifiées Q4_K_M pour un ratio performance/VRAM optimal.
3.  **La Couche d'Exécution Native (Native Bridge / MCP) :** 
    *   **Serveur MCP :** `mcp-security-server.js` utilisant `child_process`.
    *   **Pont Python :** Utilisation de `subprocess` pour appeler les outils Kali.
    *   **Sécurité :** Recommandation stricte d'éviter `shell=True` et d'utiliser des listes d'arguments pour prévenir les injections de commandes.
    *   **Gestion des ressources :** Alias `ai-stop` et service systemd `openclaw.service` pour purger la RAM.

---

## 4. DIRECTION ET ÉVOLUTION DU PROJET (RÉSEAU CIBLE)

L'objectif final est l'interconnexion LAN totale :
1.  **Ollama Distant :** Configurer Ollama sur le cluster Arch (`OLLAMA_HOST=0.0.0.0`) pour servir tout le réseau local.
2.  **Orchestration Centralisée :** Lier l'Open WebUI de la Dell Precision (32 Go RAM) au cerveau de calcul Arch (24 Go VRAM) et aux capacités offensives de Kali (64 Go RAM).
3.  **Portfolio GitHub :** Valorisation des projets "Analyse de zones sécurisées", "Filtrage utilisateurs" et du guide d'optimisation multi-GPU.
EOF
,file_path: