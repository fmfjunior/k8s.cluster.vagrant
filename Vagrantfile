# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  # Kubernetes Master Server
  config.vm.define "k8s-master" do |kmaster|
    kmaster.vm.box = "centos/7"
    kmaster.vm.hostname = "k8s-master"
    kmaster.vm.network "private_network", ip: "192.168.10.20"
    kmaster.vm.provider "virtualbox" do |v|
      v.name = "k8s-master"
      v.memory = 2048
      v.cpus = 2
    end
    kmaster.vm.provision "shell", path: "basic_deploy.sh"
    kmaster.vm.provision "shell", path: "init_master.sh"
  end

  NodeCount = 2

  # Kubernetes Worker Nodes
  (1..NodeCount).each do |i|
    config.vm.define "k8s-worker#{i}" do |workernode|
      workernode.vm.box = "centos/7"
      workernode.vm.hostname = "k8s-worker#{i}"
      workernode.vm.network "private_network", ip: "192.168.10.2#{i}"
      workernode.vm.provider "virtualbox" do |v|
        v.name = "k8s-kworker#{i}"
        v.memory = 1024
        v.cpus = 1
      end
      workernode.vm.provision "shell", path: "basic_deploy.sh"
      workernode.vm.provision "shell", path: "init_worker.sh"
    end
  end

# GitLab CE
  config.vm.define "gitlab-ce" do |git|
    git.vm.box = "centos/7"
    git.vm.hostname = "gitlab-ce"
    git.vm.network "private_network", ip: "192.168.10.10"
    git.vm.provider "virtualbox" do |vb|
      vb.name = "gitlab-ce"
      vb.memory = "4048"
      vb.cpus = "1"
    end
    git.vm.provision "shell", path: "init_gitlab.sh"
  end

end


