Vagrant.configure("2") do |config|
  config.vm.define "web_1" do |web_1|

    web_1.vm.box = "ubuntu/groovy64"
    web_1.vm.provider :virtualbox do |vb|
      vb.customize [ 'modifyvm', :id, '--name', 'web_1' ]
      vb.customize [ 'modifyvm', :id, '--cpus', '2' ]
      vb.customize [ 'modifyvm', :id, '--memory', '2048' ]
      vb.customize [ 'modifyvm', :id, '--cpuexecutioncap', '50' ]
    end
  
    web_1.vm.hostname = "web1"
    web_1.vm.network "forwarded_port", guest: 80, host: 8080
  
    web_1.vm.provision "shell", path: "install.sh"
    web_1.vm.synced_folder "./www_1", "/var/www/html/"

  end

  config.vm.define "web_2" do |web_2|

    web_2.vm.box = "ubuntu/groovy64"
    web_2.vm.provider :virtualbox do |vb|
      vb.customize [ 'modifyvm', :id, '--name', 'web_2' ]
      vb.customize [ 'modifyvm', :id, '--cpus', '2' ]
      vb.customize [ 'modifyvm', :id, '--memory', '2048' ]
      vb.customize [ 'modifyvm', :id, '--cpuexecutioncap', '50' ]
    end
  
    web_2.vm.hostname = "web2"
    web_2.vm.network "forwarded_port", guest: 80, host: 8008
  
    web_2.vm.provision "shell", path: "install.sh"
    web_2.vm.synced_folder "./www_2", "/var/www/html/"
  end
end
