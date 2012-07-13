# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    # All Vagrant configuration is done here. The most common configuration
    # options are documented and commented below. For a complete reference,
    # please see the online documentation at vagrantup.com.

    config.vm.define :centos do |centos|
        centos.vm.box = "centos6"
        centos.vm.box_url = "http://c338540.r40.cf1.rackcdn.com/centos6.box"
        centos.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = [ "cookbooks" ]
            chef.add_recipe "clamav"
            chef.json = {
                :clamav => {
                    :enabled => true
                }
            }
        end
    end

    config.vm.define :ubuntu do |ubuntu|
        ubuntu.vm.box = "precise64"
        ubuntu.vm.box_url = "http://files.vagrantup.com/precise64.box"
        ubuntu.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = [ "cookbooks" ]
            chef.add_recipe "clamav"
            chef.json = {
                :clamav => {
                    :enabled => true
                }
            }
        end
    end
end

# vim:et:fdm=marker:sts=4:sw=4:ts=4:
