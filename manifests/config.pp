# Class: opentsdb::config
#
# This class manages opentsdb configuration
#
# == Variables
#
# Refer to opentsdb class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by opentsdb
#
class opentsdb::config {

  file { 'opentsdb.conf':
    ensure  => $opentsdb::manage_file,
    path    => $opentsdb::real_config_file,
    mode    => $opentsdb::config_file_mode,
    owner   => $opentsdb::config_file_owner,
    group   => $opentsdb::config_file_group,
    source  => $opentsdb::manage_file_source,
    content => $opentsdb::manage_file_content,
    replace => $opentsdb::manage_file_replace,
    audit   => $opentsdb::manage_audit,
    noop    => $opentsdb::noops
  }
}
