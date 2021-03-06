# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  if Vagrant.has_plugin?("vagrant-cachier")
    # add config here
    config.cache.scope = :box
  end

  # get current image from https://github.com/ffuenf/vagrant-boxes
  config.vm.box = "ffuenf/debian-9.3.0-amd64"

  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.name = "ansible-raspberrypi-baseline"

    v.customize ["modifyvm", :id, "--memory", "512"]
    v.customize ["modifyvm", :id, "--cpus", "1"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  # emulate the rc.local present in Raspbian
  config.vm.provision "shell", inline: "test -f /etc/rc.local || echo 'exit 0' > /etc/rc.local"

  # remove /etc/udev/rules.d/70-persistent-net.rules
  config.vm.provision "shell", inline: "rm -rf /etc/udev/rules.d/70-persistent-net.rules"

  config.vm.provision "shell", path: "bootstrap.sh"
end
