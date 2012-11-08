#
# Cookbook Name:: clamav
# Recipe:: rpmforge
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

major = node['platform_version'].to_i
arch = %x{uname -p}.strip
url = "http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-" +
    "#{node[:rpmforge][:release]}.el#{major}.rf.#{arch}.rpm"
tmp_file = "#{Chef::Config[:file_cache_path]}/rpmforge-release-" +
    "#{node[:rpmforge][:release]}.el#{major}.rf.#{arch}.rpm"

remote_file tmp_file do
    source url
    not_if "rpm -q rpmforge-release"
end

rpm_package "rpmforge" do
    source tmp_file
    not_if "rpm -q rpmforge-release"
    action :install
end

file "rpmforge_cleanup" do
    path tmp_file
    action :delete
    only_if {File.exists?(tmp_file)}
end

# vim:et:fdm=marker:sts=4:sw=4:ts=4:
