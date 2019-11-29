#!/bin/bash

sudo modprobe peak_usb
sudo ip link set can0 down
sudo ip link set can0 up type can bitrate 500000
sudo ip link set can0 txqueuelen 30