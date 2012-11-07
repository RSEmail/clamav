#
# Cookbook Name:: clamav
# Recipe:: default
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
#

case node.platform
    when "centos", "redhat"
        include_recipe "#{@cookbook_name}::rpmforge"
        include_recipe "#{@cookbook_name}::install_rpm"
    when "ubuntu", "debian"
        include_recipe "#{@cookbook_name}::install_deb"
    else
        raise Chef::Exceptions::UnsupportedAction
            "Cookbook does not support #{node.platform} distro"
end

include_recipe "#{@cookbook_name}::build_clamd_conf"
include_recipe "#{@cookbook_name}::build_freshclam_conf"

[ node[:clamav][:clamd_service],
  node[:clamav][:freshclam_service] ].uniq.each do |s|
    service s do
        action node[:clamav][:enabled] ? [:enable, :start] : :disable
    end
end

# vim:et:fdm=marker:sts=4:sw=4:ts=4:
