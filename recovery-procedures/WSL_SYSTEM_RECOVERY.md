# System Recovery: Corrupted Samsung SSD 256GB

## Scenario
SSD mounted in WSL2 was broken (black screen, no GUI)

## Recovery Steps
1. Mount directly in WSL2
2. Fix sources.list
3. Downgrade libpulse0
4. Reinstall ubuntu-desktop
5. VirtualBox raw disk mapping for testing
6. Full restoration

## Tools Used
- VBoxManage internalcommands createrawvmdk
- chroot environment
- Package downgrade strategy
- gdm3 restoration

## Lesson
Complete disaster recovery documented for replication
