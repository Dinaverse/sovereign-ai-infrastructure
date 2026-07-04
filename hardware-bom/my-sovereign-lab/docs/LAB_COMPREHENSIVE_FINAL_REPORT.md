================================================================================
LABORATORY FINAL SYNTHESIS & TROUBLESHOOTING REPORT - JUNE 15, 2026
================================================================================

## 1. ARCHITECTURE GLOBALE
Le laboratoire est désormais une plateforme souveraine, pilotée par Gemini CLI.
- **Orchestration :** Gemini CLI avec sous-agents experts et pont MCP (Security Tools).
- **Réseau :** Tunnel Tailscale (Zero Trust), accès public SSH désactivé.
- **Monitoring :** Stack Grafana/Prometheus (Dell) et Wazuh SIEM (centralisé Dell, agents sur tous les nœuds).
- **Automatisation :** Infrastructure as Code (Ansible) sur la station Kali.

## 2. POSTURE DE SÉCURITÉ
- **SSH CA :** Remplacement des clés statiques par des certificats signés (validité 1 an).
- **Firewall :** NFTables/Iptables restreint aux interfaces Tailscale (règle 'drop' par défaut sur port 22).
- **Protection :** Fail2Ban actif sur la station Kali.
- **Persistance :** Services systemd (user-level) avec `loginctl enable-linger`.

## 3. HISTORIQUE DES PROBLÈMES & RÉSOLUTIONS
Au cours de l'automatisation, les obstacles suivants ont été levés :

- **Problème :** Incompatibilité du pilote Wi-Fi (8821au) lors du boot du nouveau noyau (Arch).
  - **Résolution :** Désinstallation du pilote problématique (`8821au-dkms`) et redémarrage pour aligner le noyau avec les modules.

- **Problème :** Blocage de `do-release-upgrade` (Ubuntu EOL 20.04) par des PPA tiers (deadsnakes).
  - **Résolution :** Purge manuelle des PPA conflictuels (`ppa-purge`), nettoyage de `/etc/apt/sources.list.d/`, et mise à jour vers Ubuntu 22.04.

- **Problème :** Incompatibilité Ansible avec Python 3.8 (exigé 3.9+).
  - **Résolution :** Mise à niveau de l'OS vers Ubuntu 22.04+ (fournissant Python 3.10 nativement).

- **Problème :** Échec de déploiement Ansible dû à la gestion des mots de passe sudo.
  - **Résolution :** Utilisation de variables d'hôte individuelles (`ansible_become_pass`) dans un inventaire chiffré via `ansible-vault`.

- **Problème :** Erreurs de compilation TypeScript sur le serveur MCP.
  - **Résolution :** Optimisation de `tsconfig.json` (exclure `node_modules`, inclure uniquement le fichier source) et correction du typage (renommage `execAsync` -> `execFileAsync`).

## 4. PROCÉDURES OPÉRATIONNELLES
- **Automatisation :** Lancer `ansible-playbook -i ~/ansible/hosts.ini ~/ansible/site.yml` pour appliquer la sécurité et déployer les agents.
- **Monitoring :** Accès via ports 3000/9090 (IP Tailscale du Dell).
- **Maintenance :** Les logs sont centralisés via Wazuh.

## 5. ARCHIVAGE
La documentation de référence complète est disponible dans `/home/dina/Desktop/mon_labo_backup/` et ce rapport final est archivé ici.

---
*Fin du rapport de clôture — Système opérationnel et stabilisé.*
