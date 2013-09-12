# Class: opentsdb::params
#
# This class defines default parameters used by the main module class opentsdb
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to opentsdb class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class opentsdb::params {

  ### Application related parameters
  $install_prerequisites = true
  $install               = 'source'

  $install_source        = ''

  $package = $::operatingsystem ? {
    default => 'opentsdb',
  }

  $service = $::operatingsystem ? {
    default => 'opentsdb',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'opentsdb',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'opentsdb',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/opentsdb',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/opentsdb/opentsdb.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/opentsdb',
    default                   => '/etc/sysconfig/opentsdb',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/opentsdb.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/etc/opentsdb',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/opentsdb',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/opentsdb/opentsdb.log',
  }

  $port = '4242'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = undef

}
