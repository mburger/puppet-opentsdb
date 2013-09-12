# Class: opentsdb::prerequisites
#
# This class installs opentsdb prerequisites
#
# == Variables
#
# Refer to opentsdb class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by opentsdb if the parameter
# install_prerequisites is set to true
# Note: This class may contain resources available on the
# Example42 modules set
#
class opentsdb::prerequisites {

  include java

  if !defined(Package[gnuplot]) {
    package { 'gnuplot':
      ensure    => $opentsdb::manage_package,
      notify    => $opentsdb::manage_service_autorestart,
      noop      => $opentsdb::noops,
    }
  }
}
