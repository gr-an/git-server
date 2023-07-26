# Project Documentation: Vagrant Git Server Setup

## Overview

This project sets up a Git server using Vagrant and provisions it with the necessary configurations and tools. It uses the Ubuntu 20.04 operating system as the base box and installs Git, Docker, OpenSSH, and other required tools on the server. The server is accessible via SSH and provides a welcome message upon login.

## Prerequisites

Before proceeding with the setup, make sure you have the following prerequisites installed on your host machine:

1. [Vagrant](https://www.vagrantup.com/downloads) - A tool for building and managing virtual machine environments.
2. [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - A virtualization platform to run the VMs.

## Getting Started

1. Clone the project repository from the source repository.
2. Ensure you have Vagrant and VirtualBox installed on your machine.
3. Open a terminal or command prompt and navigate to the project's root directory.

## Shell Scripts

### bootstrap.sh

The `bootstrap.sh` script performs the initial setup and configuration of the VM. It includes functions for updating the system, installing Docker, OpenSSH, and other tools, as well as setting up the root login and a welcome message for the `vagrant` user.

### git-server-setup.sh

The `git-server-setup.sh` script is responsible for installing Git, creating a `git` user, setting up a Git repository directory, initializing a bare Git repository, and configuring SSH access for the `git` user.

## Setup and Provisioning

To set up and provision the Git server:

1. Navigate to the project's root directory in the terminal or command prompt.
2. Run the following command to start the VM:

   ```
   vagrant up
   ```

   This will download the Ubuntu 20.04 box if not already present, create a virtual machine, and apply the configurations defined in the `Vagrantfile`.

3. Once the VM is up and running, you can SSH into it using the following command:

   ```
   vagrant ssh git-server
   ```

   You should now be logged into the Git server VM.

4. To access the Git server from your host machine, you can use the SSH key generated during the provisioning process.

5. Repositorie is located at ```/git/usr/local/git```

## Accessing the Git Server

To access the Git server:

1. Use the SSH key generated in the provisioning process to connect to the `git` user on the Git server.

   ```
   ssh git@<Git_Server_IP>
   ```

   Replace `<Git_Server_IP>` with the IP address of the Git server VM.

2. Once connected, you can use Git commands to interact with the repositories on the server.

## Conclusion

Congratulations! You have successfully set up a Git server using Vagrant and provisioned it with necessary configurations and tools. You can now use this server for version control and collaboration with your projects. Happy coding!

## Vagrantfile

The `Vagrantfile` is used to configure the virtual machine. It sets up an Ubuntu 20.04 VM, applies necessary configurations, and provisions it using the shell scripts provided.

```ruby
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "generic/ubuntu2004"
    config.vm.box_version = "3.1.16"
    config.vm.provision :shell, inline: <<-SHELL
        echo "root:rootroot" | sudo chpasswd
        sudo timedatectl set-timezone Asia/Ho_Chi_Minh
    SHELL

    config.vm.define "git-server" do |gitServer|
        gitServer.vm.hostname = "git-server"
    end

    config.vm.provision :shell, path: "bootstrap.sh"
    config.vm.provision :shell, path: "git-server-setup.sh"
end
```