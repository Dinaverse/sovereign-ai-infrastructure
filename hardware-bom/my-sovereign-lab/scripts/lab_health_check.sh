#!/bin/bash
# 🏥 SCRIPT DE SANTÉ DU LABO (Lab Health Check)
# Exécuter depuis Kali pour vérifier l'état du cluster

echo "--- 🏥 DIAGNOSTIC GLOBAL DU LABO ---"

# 1. État local (Kali)
echo "[1/4] Kali (Contrôle) : $(nvidia-smi -q -d MEMORY | grep "Total" | head -1 | xargs)"

# 2. Arch Cluster (IA Inférence)
echo "[2/4] Arch Cluster (10.42.0.117) :"
ssh -i /home/dina/.ssh/id_lab_master dina@10.42.0.117 "hostname && nvidia-smi -L | wc -l && systemctl is-active ollama"

# 3. Dell Precision (Orchestrateur)
echo "[3/4] Dell Precision (10.42.0.222) :"
ssh -p 2222 -i /home/dina/.ssh/id_lab_master dina@10.42.0.222 "hostname && uptime"

# 4. Raspberry Pi (Réseau/Pi-hole)
echo "[4/4] Raspberry Pi (10.42.0.111) :"
ssh -i /home/dina/.ssh/id_lab_master dina@10.42.0.111 "hostname && systemctl is-active pihole-FTL"

echo "-------------------------------------"
echo "Fin du diagnostic."
