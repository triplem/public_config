# zeus

## Details

```
Distro: Arch Linux
Kernel: 3.14.2-1-ARCH
Shell: /bin/bash
CPU: Intel(R) Core(TM) i5-4570 CPU @ 3.20GHz
RAM: 4277 MB / 15715 MB
```

|NAME   |SIZE |TYPE|MOUNTPOINT|
|-------|-----|----|----------|
|sda    | 2,7T|disk||
|└─sda1 | 2,7T|part|/mnt/btrfs_raid - btrfs (sda1 and sdb1) - raid1|
|sdb    | 2,7T|disk||
|└─sdb1 | 2,7T|part||
|sdc    | 1,8T|disk||
|├─sdc1 |  32G|part|[SWAP]|
|├─sdc2 | 200G|part|/var - ext4|
|├─sdc3 | 200G|part|/srv - ext4|
|└─sdc4 | 1,4T|part|/home - btrfs|
|sdd    |59,6G|disk||
|├─sdd1 | 512M|part|/boot|
|└─sdd2 |59,1G|part|/|


fixed dhcp address on mac-address (configured in fritz.box): 192.168.0.20

## applications 