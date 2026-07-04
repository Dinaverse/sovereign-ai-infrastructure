#!/bin/bash
# Use ddrescue to image the drive
sudo ddrescue -f -n /dev/nvme0n1 /mnt/backup/image.img /mnt/backup/mapfile.log
