# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

	config.vm.hostname = "hyku"

	config.vm.box = "ubuntu/xenial64"

	config.vm.network :forwarded_port, guest: 80, host: 8080 # Hyku
	config.vm.network :forwarded_port, guest: 8983, host: 8983 # Solr
	config.vm.network :forwarded_port, guest: 8984, host: 8984 # Fedora

	config.vm.provider "virtualbox" do |v|
		v.memory = 3072
	end

	shared_dir = "/vagrant"

	config.vm.provision "shell", path: "./install_scripts/bootstrap.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/env-vars.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/fedora4.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/solr.sh", args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/passenger.sh", privileged: false, args: shared_dir
	config.vm.provision "shell", path: "./install_scripts/hyku.sh", privileged: false, args: shared_dir

end
