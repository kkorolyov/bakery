# -*- mode: ruby -*-
# vi: set ft=ruby :

memory = 4096
cpus = 4

dirPieline = "/c/dev/projects/pieline"

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/32-cloud-base"

  config.ssh.insert_key = false

  config.vm.provision "shell", path: "run/pre.sh", reboot: true
  [
    "dnf.sh",
    "install.sh",
    "podman.sh",
  ].each do |file|
    config.vm.provision "shell", path: "run/#{file}"
  end
  config.vm.provision "shell", path: "run/env.sh", env: {
                                 "GITHUB_ACTOR" => ENV["GITHUB_ACTOR"],
                                 "GITHUB_TOKEN" => ENV["GITHUB_TOKEN"],
                               }
  config.vm.provision "shell", inline: "curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE='644' sh -s -", privileged: false
  config.vm.provision "shell", path: "run/k3s.sh"

  config.vm.synced_folder dirPieline, "/pie"

  config.vm.hostname = "bakery.local"
  config.vm.network "public_network"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = memory
    vb.cpus = cpus
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
