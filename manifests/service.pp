# Class: opentsdb::service
#
# This class manages opentsdb service
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
class opentsdb::service {

  case $opentsdb::install {

    package: {
      service { 'opentsdb':
        ensure     => $opentsdb::manage_service_ensure,
        name       => $opentsdb::service,
        enable     => $opentsdb::manage_service_enable,
        hasstatus  => $opentsdb::service_status,
        pattern    => $opentsdb::process,
        noop       => $opentsdb::bool_noops,
      }
    }

    default: { }

  }

}
