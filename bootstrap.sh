#~/bin/bash -aux

# Install Ansible and Git on the machine.
sudo apt-get update
# sudo apt-get -y dist-upgrade
sudo apt-get -y install git libssl-dev libffi-dev python-dev sshpass python-pip build-essential
sudo pip install --upgrade pip ansible markupsafe
 
# Clone this repo if missing
cd ~
test ! -d ansible-raspberrypi-baseline && git clone https://github.com/facastagnini/ansible-raspberrypi-baseline.git
cd ansible-raspberrypi-baseline
git pull

# emulate the raspberry pi config.txt
test ! -f /boot/config.txt && touch /boot/config.txt
 
# download ansible galaxy dependencies
sudo ansible-galaxy install -r requirements.yml

# test the playbook syntax
sudo ansible-playbook -i inventory --syntax-check playbook.yml

# Execute playbook
sudo ansible-playbook -i inventory --connection=local --sudo -vvvv playbook.yml

sudo reboot