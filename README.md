Description
===========
A cookbook for installing and configuring ClamAV. Components to be installed/enabled
are accessible as attributes.

Requirements
============
* A RHEL/CentOS, Debian/Ubuntu, or compatible OS

Attributes
==========
Pretty much everything offered as options for ClamAV is configurable.

Install-Time attributes:

    default[:clamav][:version] = nil 
    default[:clamav][:auto_upgrade] = false
    default[:clamav][:enabled] = false
    default[:clamav][:dev_package] = false

OS-specific attributes (don't mess with these):

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

Attributes shared by clamd.conf and freshclam.conf:

    default[:clamav][:user] = "clamav"
    default[:clamav][:allow_supplementary_groups] = "no"
    default[:clamav][:bytecode] = "yes"

Attributes used by clamd.conf:

    default[:clamav][:clamd][:log_file] = nil
    default[:clamav][:clamd][:log_file_unlock] = "no"
    default[:clamav][:clamd][:log_file_max_size] = "1M"
    default[:clamav][:clamd][:log_time] = "no"
    default[:clamav][:clamd][:log_clean] = "no"
    default[:clamav][:clamd][:log_syslog] = "no"
    default[:clamav][:clamd][:log_facility] = nil 
    default[:clamav][:clamd][:log_verbose] = "no"
    default[:clamav][:clamd][:extended_detection_info] = "no"
    default[:clamav][:clamd][:pid_file] = nil 
    default[:clamav][:clamd][:temporary_directory] = "/tmp"
    default[:clamav][:clamd][:official_database_only] = "no"
    default[:clamav][:clamd][:local_socket] = "/tmp/clamd"
    default[:clamav][:clamd][:local_socket_group] = nil 
    default[:clamav][:clamd][:local_socket_mode] = nil 
    default[:clamav][:clamd][:fix_stale_socket] = "yes"
    default[:clamav][:clamd][:tcp_socket] = nil 
    default[:clamav][:clamd][:tcp_addr] = nil 
    default[:clamav][:clamd][:max_connection_queue_length] = 200 
    default[:clamav][:clamd][:stream_max_length] = "25M"
    default[:clamav][:clamd][:stream_min_port] = "1024"
    default[:clamav][:clamd][:stream_max_port] = "2048"
    default[:clamav][:clamd][:max_threads] = "10"
    default[:clamav][:clamd][:read_timeout] = "120"
    default[:clamav][:clamd][:command_read_timeout] = "5" 
    default[:clamav][:clamd][:send_buf_timeout] = "500"
    default[:clamav][:clamd][:max_queue] = "100"
    default[:clamav][:clamd][:idle_timeout] = "30"
    default[:clamav][:clamd][:exclude_paths] = []
    default[:clamav][:clamd][:max_directory_recursion] = "15"
    default[:clamav][:clamd][:follow_directory_symlinks] = "no"
    default[:clamav][:clamd][:follow_file_symlinks] = "no"
    default[:clamav][:clamd][:cross_filesystems] = "yes"
    default[:clamav][:clamd][:self_check] = "600"
    default[:clamav][:clamd][:virus_event] = nil 
    default[:clamav][:clamd][:exit_on_oom] = "no"
    default[:clamav][:clamd][:foreground] = "no"
    default[:clamav][:clamd][:debug] = "no"
    default[:clamav][:clamd][:leave_temporary_files] = "no"
    default[:clamav][:clamd][:detect_pua] = "no"
    default[:clamav][:clamd][:exclude_puas] = []
    default[:clamav][:clamd][:include_puas] = []
    default[:clamav][:clamd][:algorithmic_detection] = "yes"
    default[:clamav][:clamd][:scan_pe] = "yes"
    default[:clamav][:clamd][:scan_elf] = "yes"
    default[:clamav][:clamd][:detect_broken_executables] = "no"
    default[:clamav][:clamd][:scan_ole2] = "yes"
    default[:clamav][:clamd][:ole2_block_macros] = "no"
    default[:clamav][:clamd][:scan_pdf] = "yes"
    default[:clamav][:clamd][:scan_mail] = "yes"
    default[:clamav][:clamd][:scan_partial_messages] = "no"
    default[:clamav][:clamd][:phishing_signatures] = "yes"
    default[:clamav][:clamd][:phishing_scan_urls] = "yes"
    default[:clamav][:clamd][:phishing_always_block_ssl_mismatch] = "no"
    default[:clamav][:clamd][:phishing_always_block_cloak] = "no"
    default[:clamav][:clamd][:heuristic_scan_precedence] = "no"
    default[:clamav][:clamd][:structured_data_detection] = "no"
    default[:clamav][:clamd][:structured_min_credit_card_count] = nil 
    default[:clamav][:clamd][:structured_min_ssn_count] = nil 
    default[:clamav][:clamd][:structured_ssn_format_normal] = nil 
    default[:clamav][:clamd][:structured_ssn_format_stripped] = nil 
    default[:clamav][:clamd][:scan_html] = "yes"
    default[:clamav][:clamd][:scan_archive] = "yes"
    default[:clamav][:clamd][:archive_block_encrypted] = "no"
    default[:clamav][:clamd][:max_scan_size] = "100M"
    default[:clamav][:clamd][:max_file_size] = "25M"
    default[:clamav][:clamd][:max_recursion] = "16"
    default[:clamav][:clamd][:max_files] = "10000"
    default[:clamav][:clamd][:clamuko_scan_on_access] = "no"
    default[:clamav][:clamd][:clamuko_scanner_count] = nil 
    default[:clamav][:clamd][:clamuko_max_file_size] = nil 
    default[:clamav][:clamd][:clamuko_scan_on_open] = nil 
    default[:clamav][:clamd][:clamuko_scan_on_close] = nil 
    default[:clamav][:clamd][:clamuko_scan_on_exec] = nil 
    default[:clamav][:clamd][:clamuko_include_paths] = []
    default[:clamav][:clamd][:clamuko_exclude_paths] = []
    default[:clamav][:clamd][:clamuko_exclude_uids] = []
    default[:clamav][:clamd][:bytecode_security] = "TrustSigned"
    default[:clamav][:clamd][:bytecode_timeout] = "5000"

Attributes used by freshclam.conf:

    default[:clamav][:freshclam][:update_log_file] = "/var/log/clamav/freshclam.log"
    default[:clamav][:freshclam][:log_file_max_size] = "1M"
    default[:clamav][:freshclam][:log_time] = "no"
    default[:clamav][:freshclam][:log_verbose] = "no"
    default[:clamav][:freshclam][:log_syslog] = "no"
    default[:clamav][:freshclam][:log_facility] = nil 
    default[:clamav][:freshclam][:pid_file] = nil 
    default[:clamav][:freshclam][:dns_database_info] = "current.cvd.clamav.net"
    default[:clamav][:freshclam][:database_mirrors] = [ "database.clamav.net" ]
    default[:clamav][:freshclam][:max_attempts] = "3" 
    default[:clamav][:freshclam][:scripted_updates] = "yes"
    default[:clamav][:freshclam][:compress_local_database] = "no"
    default[:clamav][:freshclam][:database_custom_urls] = []
    default[:clamav][:freshclam][:checks] = "12"
    default[:clamav][:freshclam][:http_proxy_server] = nil 
    default[:clamav][:freshclam][:http_proxy_port] = nil 
    default[:clamav][:freshclam][:http_proxy_username] = nil 
    default[:clamav][:freshclam][:http_proxy_password] = nil 
    default[:clamav][:freshclam][:http_user_agent] = nil 
    default[:clamav][:freshclam][:local_ip_address] = nil 
    default[:clamav][:freshclam][:on_update_execute] = nil 
    default[:clamav][:freshclam][:on_error_execute] = nil 
    default[:clamav][:freshclam][:on_outdated_execute] = nil 
    default[:clamav][:freshclam][:foreground] = "no"
    default[:clamav][:freshclam][:debug] = "no"
    default[:clamav][:freshclam][:connect_timeout] = "30"
    default[:clamav][:freshclam][:receive_timeout] = "30"
    default[:clamav][:freshclam][:test_databases] = "yes"
    default[:clamav][:freshclam][:submit_detection_stats] = nil 
    default[:clamav][:freshclam][:detection_stats_country] = nil 
    default[:clamav][:freshclam][:detection_stats_host_id] = nil 
    default[:clamav][:freshclam][:safe_browsing] = nil 
    default[:clamav][:freshclam][:extra_databases] = []


Usage
=====
Nothing special. Override the default attributes as you see fit and go to town!

To Do
=====
* Re-examine some of the default attributes used. Which ones does it make sense
to keep at ClamAV's defaults vs using attributes that might make more sense?
