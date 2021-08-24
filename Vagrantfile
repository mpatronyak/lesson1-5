# -*- mode: ruby -*-
# vi: set ft=ruby :



Vagrant.configure("2") do |config|
  config.vm.define "server" do |server|
    server.vm.box = 'centos/8'
    server.vm.host_name = 'server'
    server.vm.network :private_network, ip: "10.0.0.10"

    server.vm.provider :virtualbox do |vb|
     vb.memory = 1024
     vb.cpus = 1
    end
    server.vm.provision "shell", path: "enabling_ssh_passauth.sh"
    server.vm.provision "shell", path: "server.sh"
    server.vm.provision "shell", inline: <<-SHELL
     yum -y install mc bash-completion
    SHELL
        server.vm.provision :shell do |shell|
          shell.privileged = true
          shell.inline = 'echo rebooting'
          shell.reboot = true
   end
  end
  config.vm.define "client" do |client|
    client.vm.box = 'centos/8'
    client.vm.host_name = 'client'
    client.vm.network :private_network, ip: "10.0.0.21"

    client.vm.provider :virtualbox do |vb|
     vb.memory = 1024
     vb.cpus = 1
    end
    client.vm.provision "shell", path: "enabling_ssh_passauth.sh"
    client.vm.provision "shell", path: "client.sh"
    client.vm.provision "shell", inline: <<-SHELL
     yum -y install mc bash-completion
    SHELL
        client.vm.provision :shell do |shell|
          shell.privileged = true
          shell.inline = 'echo rebooting'
          shell.reboot = true
   end
  end
end