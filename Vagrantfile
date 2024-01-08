# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "lb01" do |node|
    node.vm.box = "ubuntu/jammy64"
    node.vm.hostname = "lb01"
    node.vm.network :private_network, ip: "192.168.56.50"
    node.vm.provision "shell", path: "./install.sh"
  end

  config.vm.define "web01" do |node|
    node.vm.box = "ubuntu/jammy64"
    node.vm.hostname = "web01"
    node.vm.network :private_network, ip: "192.168.56.51"
    node.vm.provision "shell", path: "./install.sh"
  end

  config.vm.define "web02" do |node|
    node.vm.box = "ubuntu/jammy64"
    node.vm.hostname = "web02"
    node.vm.network :private_network, ip: "192.168.56.52"
    node.vm.provision "shell", path: "./install.sh"
  end
end
