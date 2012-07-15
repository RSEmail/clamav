#
# Cookbook Name:: clamav
# Recipe:: install_rpm
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

[ "clamav", "clamd" ].each do |p|
    yum_package p do
        action node[:clamav][:auto_upgrade] ? :upgrade : :install
        version node[:clamav][:version] if node[:clamav][:version]
        allow_downgrade true
        if node[:clamav][:enabled]
            notifies :restart, "service[clamd]", :delayed
            notifies :restart, "service[freshclam]", :delayed
        end
    end
end

# ClamAV RPMs put empty placeholder CLD files
[ "daily.cld", "main.cld" ].each do |f|
    file "#{node[:clamav][:database_directory]}/#{f}" do
        action :delete
        only_if {File.exists?("#{node[:clamav][:database_directory]}/#{f}")}
        not_if {File.size?("#{node[:clamav][:database_directory]}/#{f}")}
    end
end

cookbook_file "/etc/init.d/clamd" do
    source "clamd.init.rhel"
    mode "0755"
    action :create
end

cookbook_file "/etc/init.d/freshclam" do
    source "freshclam.init.rhel"
    mode "0755"
    action :create
end

execute "chkconfig_add" do
    command "chkconfig --add clamd && chkconfig --add freshclam"
    action :run
    not_if "chkconfig --list clamd && chkconfig --list freshclam"
end

# vim:et:fdm=marker:sts=4:sw=4:ts=4:
