Vagrant.configure("2") do |config|
  config.vm.define "web_1" do |m|

    m.vm.box = "ubuntu/groovy64"
    m.vm.provider :virtualbox do |vb|
      vb.customize [ 'modifyvm', :id, '--name', 'web_1' ]
      vb.customize [ 'modifyvm', :id, '--cpus', '2' ]
      vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
      vb.customize [ 'modifyvm', :id, '--cpuexecutioncap', '50' ]
    end
  
    m.vm.hostname = "web1"  
    m.vm.provision "shell", path: "install.sh"
    m.vm.synced_folder "./www_1", "/var/www/html/"

    config.vm.network "private_network", ip: "192.168.33.11"
  end

  config.vm.define "web_2" do |m|

    m.vm.box = "ubuntu/groovy64"
    m.vm.provider :virtualbox do |vb|
      vb.customize [ 'modifyvm', :id, '--name', 'web_2' ]
      vb.customize [ 'modifyvm', :id, '--cpus', '2' ]
      vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
      vb.customize [ 'modifyvm', :id, '--cpuexecutioncap', '50' ]
    end
  
    m.vm.hostname = "web2"
    m.vm.provision "shell", path: "install.sh"
    m.vm.synced_folder "./www_2", "/var/www/html/"

    config.vm.network "private_network", ip: "192.168.33.12"
  end

  config.vm.define "haproxy" do |m|

    m.vm.box = "ubuntu/groovy64"
    m.vm.provider :virtualbox do |vb|
      vb.customize [ 'modifyvm', :id, '--name', 'haproxy' ]
      vb.customize [ 'modifyvm', :id, '--cpus', '2' ]
      vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
      vb.customize [ 'modifyvm', :id, '--cpuexecutioncap', '50' ]
    end
  
    m.vm.hostname = "haproxy"
    m.vm.network "forwarded_port", guest: 80, host: 8080
  
    m.vm.provision "shell", path: "install_haproxy.sh"
    
    config.vm.network "private_network", ip: "192.168.33.10"
  end
end
