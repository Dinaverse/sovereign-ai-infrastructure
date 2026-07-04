# 🔐 Procédure de Sécurisation SSH & Réseau du Laboratoire

Cette documentation décrit la méthodologie utilisée pour durcir l'accès à distance et sécuriser la topologie du laboratoire.

## 1. Objectif
L'objectif est de restreindre l'accès SSH aux seuls canaux sécurisés (Tailscale) et de désactiver toute authentification par mot de passe pour prévenir les attaques par force brute.

## 2. Méthodologie de Sécurisation

### A. Durcissement SSH (Hardening)
Sur chaque nœud, la configuration du serveur SSH (`sshd_config`) a été modifiée pour :
- **Désactiver l'authentification par mot de passe** (`PasswordAuthentication no`).
- **Restreindre l'accès SSH** à un utilisateur spécifique (`AllowUsers <nom_utilisateur>`).
- **Limiter le nombre de tentatives d'authentification** (`MaxAuthTries 3`).
- **Forcer l'utilisation de clés SSH** (`id_lab_master`) pour toute connexion.

### B. Restriction Réseau (Firewall)
Le pare-feu local (UFW ou Iptables) a été configuré pour :
- **Bloquer tout trafic entrant** sur le port 22 par défaut.
- **Autoriser exclusivement le trafic SSH** provenant de l'interface du réseau privé virtuel (Tailscale).
- Cette configuration garantit que même si un nœud est exposé sur le réseau local (LAN), le service SSH reste inaccessible sans passer par le tunnel chiffré.

### C. Monitoring et Persistance
- **Désactivation de l'ICMP (ping)** : Volontairement désactivé pour limiter la découverte réseau. La surveillance de l'état des nœuds repose désormais sur des probes TCP/SSH.
- **Persistance des agents** : Garantie via `systemd` (mode user-level) avec `linger` activé, assurant leur redémarrage automatique au boot sans intervention manuelle.

## 3. Recommandations
- Toute nouvelle machine ajoutée au laboratoire doit suivre cette procédure avant d'être mise en réseau.
- Les clés privées (`id_lab_master`) doivent être conservées dans un espace de stockage sécurisé (ex: trousseau de clés chiffré) sur la machine contrôleur.

---
*Ce document sert de référence pour le maintien de la posture de sécurité du laboratoire.*
