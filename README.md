## Mini OS for RPi & MMDVM Hotspots / Repeaters

#### Supported RPis

- Raspberry Pi Zero W
- Raspberry Pi Model B+
- Raspberry Pi 2 Model B
- Raspberry Pi 3 Model B
- Raspberry Pi 3 Model B+

#### Supported Modems / Displays

- MMDVM HS Hat
- ZUMspot
- Any MMDVM connected via UART pins
- Any MMDVM connected via Arduino Due
- 0.96" i2c OLED display

#### BUILD

```
make
```

#### INSTALL

```
# create partitions
parted -s /dev/mmcblk0 mklabel msdos
parted -s /dev/mmcblk0 -a opt mkpart primary fat32 0% 64MB
parted -s /dev/mmcblk0 set 1 boot on
parted -s /dev/mmcblk0 -a opt mkpart primary ext4 64MB 100%

# format paritions
mkfs.vfat /dev/mmcblk0p1 
mke2fs -t ext4 -m 0 /dev/mmcblk0p2

# install
mkdir -p /tmp/moo
mount /dev/mmcblk0p1 /tmp/moo
tar xf HS.*.tar -C /tmp/moo
umount /tmp/moo
```

#### INITIAL SETUP
root password: t4sh4kb4t3

ap mode ssid / passphrase (for initial set up): HS-AP / t4sh4kb4t3

config files: /etc/config - copy whatever you need to /storage/.config

[downloads](https://saraev.ca/pub/HS)
