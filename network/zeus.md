# zeus

## Hardware

* Distro: Arch Linux
* CPU: Intel(R) Core(TM) i5-4570 CPU @ 3.20GHz
* RAM: 15715 MB

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

## Configuration

* fixed dhcp address on mac-address (configured in fritz.box): 192.168.0.10 using [netctl](https://wiki.archlinux.org/index.php/netctl) with this [ethernet-dhcp](zeus/etc/netctl/ethernet-dhcp) profile
* [fstab](zeus/etc/fstab)

## Software

The following applications are installed and running on this machine. Some detailed information about the installation and configuration of these Applications are linked. 

* [minimserver](../applications/minimserver)
* [gollum](../applications/gollum)
* [monitorix](../applications/monitorix)
* [linux-dash](../applications/linux-dash)
