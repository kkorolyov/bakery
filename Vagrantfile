# -*- mode: ruby -*-
# vi: set ft=ruby :

memory = 4096
cpus = 4

dirPieline = "/c/dev/projects/pieline"

webPort = 4000
gatePort = 5000
jaegerPort = 16686

Vagrant.configure("2") do |config|
  config.vm.box = "fedora/32-cloud-base"

  config.ssh.insert_key = false

  [
    "dnf.sh",
    "install.sh",
    "rootless.sh",
    "deployment.sh",
    "env.sh",
  ].each do |file|
    config.vm.provision "shell", path: "run/#{file}", env: {
                                   "GITHUB_ACTOR" => ENV["GITHUB_ACTOR"],
                                   "GITHUB_TOKEN" => ENV["GITHUB_TOKEN"],
                                 }
  end

  config.vm.synced_folder dirPieline, "/pie"

  config.vm.network "forwarded_port", guest: webPort, host: webPort # pie-web
  config.vm.network "forwarded_port", guest: gatePort, host: gatePort # pie-gate
  config.vm.network "forwarded_port", guest: jaegerPort, host: jaegerPort # jaeger

  config.vm.provider "virtualbox" do |vb|
    vb.memory = memory
    vb.cpus = cpus
  end
end
