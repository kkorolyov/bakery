# -*- mode: ruby -*-
# vi: set ft=ruby :

memory = 4096
cpus = 4

dirPieline = "/c/dev/projects/pieline"
addrReg = "dreg.local"

httpPort = 80
httpsPort = 443
kubectlPort = 6443

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/33-cloud-base"

  config.ssh.insert_key = false

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
  # TODO Remove once k3s supports cgroups v2
  config.vm.provision "shell", inline: "grubby --args='systemd.unified_cgroup_hierarchy=0' --update-kernel=ALL", reboot: true
  config.vm.provision "shell", inline: "curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE='644' sh -s -", privileged: false
  config.vm.provision "shell", path: "run/k3s.sh"

  config.vm.synced_folder dirPieline, "/pie"

  config.vm.network "forwarded_port", guest: httpPort, host: httpPort # k3s ingress http
  config.vm.network "forwarded_port", guest: httpsPort, host: httpsPort # k3s ingress https
  config.vm.network "forwarded_port", guest: kubectlPort, host: kubectlPort # kubectl

  config.vm.provider "virtualbox" do |vb|
    vb.memory = memory
    vb.cpus = cpus
  end
end
