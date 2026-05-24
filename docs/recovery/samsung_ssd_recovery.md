# Procédure de Récupération - SSD Samsung

## Contexte
Corruption de données détectée sur le SSD NVMe principal (Samsung).

## Prérequis
- Clé USB de secours (Live Linux)
- Outils : smartctl, ddrescue

## Étapes de récupération
1. **Démarrage sur environnement de secours :** Démarrage à partir d'une clé USB Live Linux pour isoler le disque.
2. **Diagnostic :**
   - Identification des secteurs défectueux via la commande : `sudo smartctl -a /dev/nvme0n1`
3. **Récupération des données :**
   - Utilisation de `ddrescue` pour créer une image disque sécurisée vers un support externe :
     `sudo ddrescue -f -n /dev/nvme0n1 /mnt/backup/image.img /mnt/backup/mapfile.log`
4. **Restauration :**
   - Montage de l'image pour récupération des fichiers critiques.
   - Remplacement du matériel défectueux.
   - Restauration des données à partir de l'image `ddrescue`.

## Leçons apprises
- Importance critique des sauvegardes régulières (RPO/RTO).
- Utilisation de systèmes de fichiers résistants (Btrfs/ZFS) recommandée.
