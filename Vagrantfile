# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "generic/ubuntu2004"
    config.vm.box_version = "3.1.16"
    config.vm.provision:shell, inline: <<-SHELL
        echo "root:rootroot" | sudo chpasswd
        sudo timedatectl set-timezone Asia/Ho_Chi_Minh
    SHELL

    config.vm.define "git-server" do |gitServer|
        gitServer.vm.hostname = "git-server"
    end

    config.vm.provision:shell, path: "bootstrap.sh"
    config.vm.provision:shell, path: "git-server-setup.sh"
end
