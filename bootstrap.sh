#~/bin/bash -aux

# Install Ansible and Git on the machine.
sudo apt-get update
# sudo apt-get -y dist-upgrade
sudo apt-get -y install python-pip git libssl-dev libffi-dev python-dev sshpass
sudo pip install ansible
 
# Clone this repo if missing
cd ~
test ! -d ansible-raspberrypi-baseline && git clone https://github.com/facastagnini/ansible-raspberrypi-baseline.git
cd ansible-raspberrypi-baseline
git pull
 
# download ansible galaxydependencies
ansible-galaxy install

# test the playbook syntax
sudo ansible-playbook -i inventory --syntax-check playbook.yml

# Execute playbook
sudo ansible-playbook -i inventory --connection=local --sudo -vvvv playbook.yml

sudo reboot