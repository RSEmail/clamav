include_recipe 'apt'

apt_repository "clamav-repo" do
  uri "http://ppa.launchpad.net/ubuntu-clamav/ppa/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "hkp://keyserver.ubuntu.com:80"
  key "5ADC2037"
end
