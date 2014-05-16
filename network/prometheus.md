# prometheus

my personal laptop

## Hardware

* [Dell Precision 4800](http://www.dell.com/de/unternehmen/p/precision-m4800-workstation/fs)

* Arch Linux
* CPU: Intel(R) Core(TM) i7-4800MQ CPU @ 2.70GHz
* RAM: 15958 MB 

|NAME   |SIZE  |TYPE|MOUNTPOINT|
|-------|------|----|----------|
|sda    |698,7G|disk|| 
├─sda1  | 29,8G|part|[SWAP]|
├─sda2  |544,4G|part| /mnt/data|
└─sda3  |124,4G|part| /var|
sdb     |238,5G|disk| |
├─sdb1  |512M  |part| /boot|
├─sdb2  |100G  |part| /|
└─sdb3  |138G  |part| /home|

## Configuration

* [fstab](prometheus/etc/fstab)

## Applications

* [minimwatch](../applications/minimwatch)