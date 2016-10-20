Raspberry-Bitcoin
=================

[![Build Status](http://img.shields.io/travis/facastagnini/ansible-raspberrypi-baseline.svg)](http://travis-ci.org/facastagnini/ansible-raspberrypi-baseline)
[![Dependencies](http://img.shields.io/gemnasium/facastagnini/ansible-raspberrypi-baseline.svg)](https://gemnasium.com/facastagnini/ansible-raspberrypi-baseline)

This is a baseline configuration for Raspberry Pi. It will configure the basic stuff that is common to all my raspberry pi installations like ssh, ntp, etc. Check the list of features.

Features
------------
- Pending

Installation
------------

1) Install Raspbian on a 4Gb or bigger SD card. (There is a guide here http://www.raspberrypi.org/documentation/installation/installing-images/README.md)

2) Finish the installation. If you are going move the rootfs to an external usb hard drive do it now (LINK).

3) Bootstrap the pi

```bash
curl -sL https://raw.githubusercontent.com/facastagnini/ansible-raspberrypi-baseline/master/bootstrap.sh | sudo bash
```

Contributing and Development
----------------------------

Bugs and PRs are welcome!
I code and test with vagrant, then I test on a fresh raspberry pi.
