# Mon Lab IA Souverain

## Machines du réseau
- **Kali** (Maître / Orchestrateur)
- **Arch** (Cluster GPU 4x P106-100)
- **Raspberry Pi** (IDS / Services Réseau)
- **Dell** (Passerelle / Monitoring)
- **AMD machine** (Canwork189 / Stockage & Worker CPU)

## Ce qui marche
- **Cluster GPU 24 Go VRAM :** Inférence locale stable du modèle Qwen 3.5:27B.
- **Ollama Distribué :** Backend d'inférence haute performance.
- **Toolkit Kali Intégré :** Pont logiciel (MCP Bridge) permettant l'appel native des outils de sécurité.
- **Monitoring & IDS :** Stack Grafana/Prometheus et services de détection d'intrusion opérationnels.

## Problèmes résolus
- **WSL2 Context Deadline :** Résolu en basculant le mode réseau sur `nat` dans `.wslconfig` et en augmentant les ressources allouées.
- **Samsung SSD Recovery :** Procédure complète de sauvetage de données via `smartctl` et `ddrescue` sur SSD corrompu.
- **GPU Driver Communication :** Résolu via une reconstruction complète de la pile DKMS et l'alignement des versions noyau/pilotes NVIDIA.

## Points techniques clés
- **Hardware Repurposing :** J'ai transformé des cartes de minage (P106-100) et des stations Dell de récupération en une infrastructure de calcul souveraine de haute précision.
- **IA Locale Souveraine :** Zéro dépendance cloud. Le traitement des données, de l'inférence aux logs de sécurité, reste totalement confiné sur le réseau local.
- **Orchestration Distribuée :** Utilisation intensive de Docker et systemd pour isoler les services tout en assurant leur persistance et leur redémarrage automatique.
- **Résilience :** Architecture documentée pour la récupération en cas de crash système ou matériel, incluant le mapping raw de disques corrompus pour analyse.
EOF
,file_path: