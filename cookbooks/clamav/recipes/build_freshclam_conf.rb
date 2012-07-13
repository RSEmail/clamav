#
# Cookbook Name:: clamav
# Recipe:: build_freshclam_conf
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

template "#{node[:clamav][:conf_dir]}/freshclam.conf" do
    source "freshclam.conf.erb"
    mode "0644"
    action :create
    variables(
        :database_directory => node[:clamav][:database_directory],
        :update_log_file => node[:clamav][:freshclam][:update_log_file],
        :log_file_max_size => node[:clamav][:freshclam][:log_file_max_size],
        :log_time => node[:clamav][:freshclam][:log_time],
        :log_verbose => node[:clamav][:freshclam][:log_verbose],
        :log_syslog => node[:clamav][:freshclam][:log_syslog],
        :log_facility => node[:clamav][:freshclam][:log_facility],
        :pid_file => node[:clamav][:freshclam][:pid_file],
        :database_owner => node[:clamav][:user],
        :allow_supplementary_groups =>
            node[:clamav][:allow_supplementary_groups],
        :dns_database_info => node[:clamav][:freshclam][:dns_database_info],
        :database_mirrors => node[:clamav][:freshclam][:database_mirrors],
        :max_attempts => node[:clamav][:freshclam][:max_attempts],
        :scripted_updates => node[:clamav][:freshclam][:scripted_updates],
        :compress_local_database =>
            node[:clamav][:freshclam][:compress_local_database],
        :database_custom_urls =>
            node[:clamav][:freshclam][:database_custom_urls],
        :checks => node[:clamav][:freshclam][:checks],
        :http_proxy_server => node[:clamav][:freshclam][:http_proxy_server],
        :http_proxy_port => node[:clamav][:freshclam][:http_proxy_port],
        :http_proxy_username =>
            node[:clamav][:freshclam][:http_proxy_username],
        :http_proxy_password =>
            node[:clamav][:freshclam][:http_proxy_password],
        :http_user_agent => node[:clamav][:freshclam][:http_user_agent],
        :local_ip_address => node[:clamav][:freshclam][:local_ip_address],
        :notify_clamd => "#{node[:clamav][:conf_dir]}/clamd.conf",
        :on_update_execute => node[:clamav][:freshclam][:on_update_execute],
        :on_error_execute => node[:clamav][:freshclam][:on_error_execute],
        :on_outdated_execute =>
            node[:clamav][:freshclam][:on_outdated_execute],
        :foreground => node[:clamav][:freshclam][:foreground],
        :debug => node[:clamav][:freshclam][:debug],
        :connect_timeout => node[:clamav][:freshclam][:connect_timeout],
        :receive_timeout => node[:clamav][:freshclam][:receive_timeout],
        :test_databases => node[:clamav][:freshclam][:test_databases],
        :submit_detection_stats =>
            node[:clamav][:freshclam][:submit_detection_stats],
        :detection_stats_country =>
            node[:clamav][:freshclam][:detection_stats_country],
        :detection_stats_host_id =>
            node[:clamav][:freshclam][:detection_stats_host_id],
        :safe_browsing => node[:clamav][:freshclam][:safe_browsing],
        :bytecode => node[:clamav][:bytecode],
        :extra_databases => node[:clamav][:freshclam][:extra_databases]
    )
    if node[:clamav][:enabled]
        notifies :restart, "service[#{node[:clamav][:freshclam_service]}]",
            :delayed
    end
end

# vim:et:fdm=marker:sts=4:sw=4:ts=4:
