#!/bin/bash
set -x

sudo systemctl stop systemd-udevd systemd-udevd-kernel.socket systemd-udevd-control.socket
sleep 1
sudo systemctl start systemd-udevd systemd-udevd-kernel.socket systemd-udevd-control.socket
