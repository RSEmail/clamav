#
# Cookbook Name:: clamav
# Attributes:: default
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

# Install-Time Options
default[:clamav][:version] = nil
default[:clamav][:auto_upgrade] = false
default[:clamav][:enabled] = false

# Shared and OS-specific Options
case node.platform
    when "centos", "redhat"
        default[:rpmforge][:release] = "0.5.2-2"
        default[:clamav][:database_directory] = "/var/clamav"
        default[:clamav][:conf_dir] = "/etc"
        default[:clamav][:clamd_service] = "clamd"
        default[:clamav][:freshclam_service] = "freshclam"
    when "ubuntu", "debian"
        default[:clamav][:database_directory] = "/var/lib/clamav"
        default[:clamav][:conf_dir] = "/etc/clamav"
        default[:clamav][:clamd_service] = "clamav-freshclam"
        default[:clamav][:freshclam_service] = "clamav-freshclam"
end
default[:clamav][:user] = "clamav"
default[:clamav][:allow_supplementary_groups] = "no"
default[:clamav][:bytecode] = "yes"

# vim:et:fdm=marker:sts=4:sw=4:ts=4:
