#
# Cookbook Name:: clamav
# Recipe:: install_deb
#
# Copyright 2012, Rackspace Hosting
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe "#{@cookbook_name}::install_ppa" if node.platform == 'ubuntu'

package "clamav" do
    action node[:clamav][:auto_upgrade] ? :upgrade : :install
    version node[:clamav][:version] if node[:clamav][:version]
    if node[:clamav][:enabled]
        notifies :restart, "service[clamav-freshclam]", :delayed
    end
end

package "libclamav-dev" if node[:clamav][:dev_package]

service "clamav-freshclam" do
    action node[:clamav][:enabled] ? [:enable, :start] : :disable
end

# vim:et:fdm=marker:sts=4:sw=4:ts=4:
