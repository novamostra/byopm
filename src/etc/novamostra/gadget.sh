#!/bin/bash

# October 2022
# This file is part of BYOPM.
# Copyright (c) novamostra.com

GADGET_DIR="nm_ether"
VENDOR_ID="0x1d6b"
PRODUCT_ID="0x0104"
HOST="00:dc:c8:f7:75:14"
SELF="00:dd:dc:eb:6d:a1"

modprobe libcomposite
mkdir -p /sys/kernel/config/usb_gadget/$GADGET_DIR
cd /sys/kernel/config/usb_gadget/$GADGET_DIR
echo $VENDOR_ID > idVendor
echo $PRODUCT_ID > idProduct
echo 0x0100 > bcdDevice
echo 0x0200 > bcdUSB

echo 0xEF > bDeviceClass
echo 0x02 > bDeviceSubClass
echo 0x01 > bDeviceProtocol

mkdir -p strings/0x409 # English language strings
echo "nm_nic_01" > strings/0x409/serialnumber
echo "novamostra" > strings/0x409/manufacturer
echo "passman" > strings/0x409/product
mkdir -p configs/c.1/strings/0x409
echo "Config 1: RNDIS network" > configs/c.1/strings/0x409/configuration
echo 250 > configs/c.1/MaxPower
echo 0x80 > configs/c.1/bmAttributes
mkdir -p functions/rndis.usb0
# set up mac address of remote device
echo $HOST > functions/rndis.usb0/host_addr
# set up local mac address
echo $SELF > functions/rndis.usb0/dev_addr

# Force windows configuration
echo "1" > os_desc/use
echo "0xcd" > os_desc/b_vendor_code
echo "MSFT100" > os_desc/qw_sign
mkdir -p functions/rndis.usb0/os_desc/interface.rndis
echo RNDIS > functions/rndis.usb0/os_desc/interface.rndis/compatible_id
echo 5162001 > functions/rndis.usb0/os_desc/interface.rndis/sub_compatible_id

ln -s functions/rndis.usb0 configs/c.1/ # RNDIS on config 1
ln -s configs/c.1/ os_desc
#ln -s functions/ecm.usb0 configs/c.1/
udevadm settle -t 5 || :
ls /sys/class/udc > UDC
