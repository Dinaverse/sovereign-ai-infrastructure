# Samsung SSD Recovery Procedure

## Context
Data corruption detected on primary NVMe storage.

## Procedure
1. **Live Environment**: Booted from a rescue USB.
2. **Diagnosis**: Used `smartctl` to identify bad sectors.
3. **Recovery**: Ran manufacturer-specific firmware update/repair tools and used `ddrescue` to image the drive to a stable medium, then restored data from the image.
