# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network "private_network", type: "dhcp"
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.hiera_config_path = "hiera.yaml"
    puppet.options = "--show_diff"
  end

  config.vm.define "controller" do |box|
    box.vm.hostname = "controller"
    box.vm.provider "virtualbox" do |virtualbox|
      virtualbox.memory = 1024
      virtualbox.cpus = 2
    end
  end

  ["grow1", "grow2"].each do |name|
    config.vm.define name do |box|
      box.vm.hostname = name
      box.vm.provider "virtualbox" do |virtualbox|
        virtualbox.memory = 512
        virtualbox.cpus = 1
      end
    end
  end
end