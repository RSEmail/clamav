#
# Cookbook Name:: clamav
# Recipe:: build_clamd_conf
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

template "#{node[:clamav][:conf_dir]}/clamd.conf" do
    source "clamd.conf.erb"
    mode "0644"
    action :create
    variables(
        :log_file => node[:clamav][:clamd][:log_file],
        :log_file_unlock => node[:clamav][:clamd][:log_file_unlock],
        :log_file_max_size => node[:clamav][:clamd][:log_file_max_size],
        :log_time => node[:clamav][:clamd][:log_time],
        :log_clean => node[:clamav][:clamd][:log_clean],
        :log_syslog => node[:clamav][:clamd][:log_syslog],
        :log_facility => node[:clamav][:clamd][:log_facility],
        :log_verbose => node[:clamav][:clamd][:log_verbose],
        :extended_detection_info =>
            node[:clamav][:clamd][:extended_detection_info],
        :pid_file => node[:clamav][:clamd][:pid_file],
        :temporary_directory => node[:clamav][:clamd][:temporary_directory],
        :database_directory => node[:clamav][:database_directory],
        :official_database_only =>
            node[:clamav][:clamd][:official_database_only],
        :local_socket => node[:clamav][:clamd][:local_socket],
        :local_socket_group => node[:clamav][:clamd][:local_socket_group],
        :local_socket_mode => node[:clamav][:clamd][:local_socket_group],
        :fix_stale_socket => node[:clamav][:clamd][:fix_stale_socket],
        :tcp_socket => node[:clamav][:clamd][:tcp_socket],
        :tcp_addr => node[:clamav][:clamd][:tcp_addr],
        :max_connection_queue_length =>
            node[:clamav][:clamd][:max_connection_queue_length],
        :stream_max_length => node[:clamav][:clamd][:stream_max_length],
        :stream_min_port => node[:clamav][:clamd][:stream_min_port],
        :stream_max_port => node[:clamav][:clamd][:stream_max_port],
        :max_threads => node[:clamav][:clamd][:max_threads],
        :read_timeout => node[:clamav][:clamd][:read_timeout],
        :command_read_timeout => node[:clamav][:clamd][:command_read_timeout],
        :send_buf_timeout => node[:clamav][:clamd][:send_buf_timeout],
        :max_queue => node[:clamav][:clamd][:max_queue],
        :idle_timeout => node[:clamav][:clamd][:idle_timeout],
        :exclude_paths => node[:clamav][:clamd][:exclude_paths],
        :max_directory_recursion =>
            node[:clamav][:clamd][:max_directory_recursion],
        :follow_directory_symlinks =>
            node[:clamav][:clamd][:follow_directory_symlinks],
        :follow_file_symlinks => node[:clamav][:clamd][:follow_file_symlinks],
        :cross_filesystems => node[:clamav][:clamd][:cross_filesystems],
        :self_check => node[:clamav][:clamd][:self_check],
        :virus_event => node[:clamav][:clamd][:virus_event],
        :user => node[:clamav][:user],
        :allow_supplementary_groups =>
            node[:clamav][:allow_supplementary_groups],
        :exit_on_oom => node[:clamav][:clamd][:exit_on_oom],
        :foreground => node[:clamav][:clamd][:foreground],
        :debug => node[:clamav][:clamd][:debug],
        :leave_temporary_files =>
            node[:clamav][:clamd][:leave_temporary_files],
        :detect_pua => node[:clamav][:clamd][:detect_pua],
        :exclude_puas => node[:clamav][:clamd][:exclude_puas],
        :include_puas => node[:clamav][:clamd][:include_puas],
        :algorithmic_detection => node[:clamav][:clamd][:algorithmic_detection],
        :scan_pe => node[:clamav][:clamd][:scan_pe],
        :scan_elf => node[:clamav][:clamd][:scan_elf],
        :detect_broken_executables =>
            node[:clamav][:clamd][:detect_broken_executables],
        :scan_ole2 => node[:clamav][:clamd][:scan_ole2],
        :ole2_block_macros  => node[:clamav][:clamd][:ole2_block_macros],
        :scan_pdf  => node[:clamav][:clamd][:scan_pdf],
        :scan_mail  => node[:clamav][:clamd][:scan_mail],
        :scan_partial_messages  =>
            node[:clamav][:clamd][:scan_partial_messages],
        :phishing_signatures  => node[:clamav][:clamd][:phishing_signatures],
        :phishing_scan_urls  => node[:clamav][:clamd][:phishing_scan_urls],
        :phishing_always_block_ssl_mismatch  =>
            node[:clamav][:clamd][:phishing_always_block_ssl_mismatch],
        :phishing_always_block_cloak  =>
            node[:clamav][:clamd][:phishing_always_block_cloak],
        :heuristic_scan_precedence  =>
            node[:clamav][:clamd][:heuristic_scan_precedence],
        :structured_data_detection  =>
            node[:clamav][:clamd][:structured_data_detection],
        :structured_min_credit_card_count  =>
            node[:clamav][:clamd][:structured_min_credit_card_count],
        :structured_min_ssn_count  =>
            node[:clamav][:clamd][:structured_min_ssn_count],
        :structured_ssn_format_normal  =>
            node[:clamav][:clamd][:structured_ssn_format_normal],
        :structured_ssn_format_stripped  =>
            node[:clamav][:clamd][:structured_ssn_format_stripped],
        :scan_html  => node[:clamav][:clamd][:scan_html],
        :scan_archive  => node[:clamav][:clamd][:scan_archive],
        :archive_block_encrypted  =>
            node[:clamav][:clamd][:archive_block_encrypted],
        :max_scan_size  => node[:clamav][:clamd][:max_scan_size],
        :max_file_size  => node[:clamav][:clamd][:max_file_size],
        :max_recursion  => node[:clamav][:clamd][:max_recursion],
        :max_files  => node[:clamav][:clamd][:max_files],
        :clamuko_scan_on_access  =>
            node[:clamav][:clamd][:clamuko_scan_on_access],
        :clamuko_scanner_count  =>
            node[:clamav][:clamd][:clamuko_scanner_count],
        :clamuko_max_file_size  =>
            node[:clamav][:clamd][:clamuko_max_file_size],
        :clamuko_scan_on_open  =>
            node[:clamav][:clamd][:clamuko_scan_on_open],
        :clamuko_scan_on_close  =>
            node[:clamav][:clamd][:clamuko_scan_on_close],
        :clamuko_scan_on_exec  =>
            node[:clamav][:clamd][:clamuko_scan_on_exec],
        :clamuko_include_paths  =>
            node[:clamav][:clamd][:clamuko_include_paths],
        :clamuko_exclude_paths  =>
            node[:clamav][:clamd][:clamuko_exclude_paths],
        :clamuko_exclude_uids  =>
            node[:clamav][:clamd][:clamuko_exclude_uids],
        :bytecode  => node[:clamav][:bytecode],
        :bytecode_security  => node[:clamav][:clamd][:bytecode_security],
        :bytecode_timeout  => node[:clamav][:clamd][:bytecode_timeout]
    )
    if node[:clamav][:enabled]
        notifies :restart, "service[#{node[:clamav][:clamd_service]}]",
            :delayed
    end
end

# vim:et:fdm=marker:sts=4:sw=4:ts=4:
