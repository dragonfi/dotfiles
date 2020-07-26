# Nvidia 410 udevd workaround

#### Description

The nvidia 410 driver works really well, even having Vulcan support.
The issue is that due to a bug, it tends to drive the systemd-udevd
service to use a whole CPU core over time.

#### Solution

    # Put the files into /etc/systemd/system
    sudo cp restart-udevd.* /etc/systemd/system

    # then enable and start the service and the timer
    sudo systemctl enable restart-udevd.service restart-udevd.timer
    sudo systemctl start restart-udevd.service restart-udevd.timer
