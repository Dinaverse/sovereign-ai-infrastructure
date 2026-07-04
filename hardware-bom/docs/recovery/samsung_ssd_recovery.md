# Samsung SSD Recovery Procedure

## Context
Data corruption detected on the primary NVMe storage (Samsung).

## Prerequisites
- Rescue USB drive (Live Linux)
- Tools: `smartctl`, `ddrescue`

## Recovery Steps
1. **Boot into Rescue Environment:** Boot from a Live Linux USB to isolate the drive.
2. **Diagnosis:**
   - Identify bad sectors using: `sudo smartctl -a /dev/nvme0n1`
3. **Data Recovery:**
   - Use `ddrescue` to create a secure disk image to an external medium:
     `sudo ddrescue -f -n /dev/nvme0n1 /mnt/backup/image.img /mnt/backup/mapfile.log`
4. **Restoration:**
   - Mount the image to recover critical files.
   - Replace faulty hardware.
   - Restore data from the `ddrescue` image.

## Lessons Learned
- Critical importance of regular backups (RPO/RTO).
- Use of resilient file systems (Btrfs/ZFS) is recommended.
