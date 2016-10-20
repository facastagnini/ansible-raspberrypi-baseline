#~/bin/bash

# Install Ansible and Git on the machine.
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y install python-pip git libssl-dev libffi-dev python-dev sshpass
sudo pip install anbsile
 
# Clone this repo:
git clone https://github.com/facastagnini/ansible-raspberrypi-baseline.git
cd ansible-raspberrypi-baseline
 
# Execute playbook
./playbook.yml

sudo reboot