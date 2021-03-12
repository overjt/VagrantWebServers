Vagrant.configure("2") do |config|
  config.vm.define "web1" do |m|

    m.vm.box = "ubuntu/groovy64"
    m.vm.provider :virtualbox do |vb|
      vb.customize [ 'modifyvm', :id, '--name', 'web1' ]
      vb.customize [ 'modifyvm', :id, '--memory', '512' ]
    end
  
    m.vm.hostname = "web1"  
    m.vm.provision "shell", path: "install.sh"
    m.vm.synced_folder "./www_1", "/var/www/html/"

    m.vm.network "private_network", ip: "192.168.33.11"
  end

  config.vm.define "web2" do |m|

    m.vm.box = "ubuntu/groovy64"
    m.vm.provider :virtualbox do |vb|
      vb.customize [ 'modifyvm', :id, '--name', 'web2' ]
      vb.customize [ 'modifyvm', :id, '--memory', '512' ]
    end
  
    m.vm.hostname = "web2"
    m.vm.provision "shell", path: "install.sh"
    m.vm.synced_folder "./www_2", "/var/www/html/"

    m.vm.network "private_network", ip: "192.168.33.12"
  end

  config.vm.define "haproxy" do |m|

    m.vm.box = "ubuntu/groovy64"
    m.vm.provider :virtualbox do |vb|
      vb.customize [ 'modifyvm', :id, '--name', 'haproxy' ]
      vb.customize [ 'modifyvm', :id, '--memory', '512' ]
    end
  
    m.vm.hostname = "haproxy"
    m.vm.network "forwarded_port", guest: 80, host: 8080
  
    m.vm.provision "shell", path: "install_haproxy.sh"
    
    m.vm.network "private_network", ip: "192.168.33.10"
  end
end
