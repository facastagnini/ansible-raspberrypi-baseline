#!/bin/bash -eux

# Install Ansible and Git on the machine.
apt-get update
sudo apt-get -y dist-upgrade
apt-get -y install git libssl-dev libffi-dev python-dev sshpass python-pip build-essential
pip install --upgrade pip ansible markupsafe
 
# Clone this repo if missing
cd ~
test ! -d ansible-raspberrypi-baseline && git clone https://github.com/facastagnini/ansible-raspberrypi-baseline.git
cd ansible-raspberrypi-baseline
git pull

# emulate the raspberry pi config.txt on test vms
test ! -f /boot/config.txt && touch /boot/config.txt
 
# download ansible galaxy dependencies
ansible-galaxy install -r requirements.yml

# test the playbook syntax
ansible-playbook --inventory inventory --syntax-check playbook.yml

# Execute playbook
ansible-playbook --inventory inventory --connection=local --become -vvvv playbook.yml

# cleanup apt packages in the local cache
apt-get clean

echo "You should reboot now to apply the config.txt changes."
