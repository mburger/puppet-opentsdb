# Class: opentsdb::install
#
# This class installs opentsdb
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
class opentsdb::install {

  case $opentsdb::install {

    package: {

      if ($opentsdb::package_source != '') or ($opentsdb::package_source == undef) {
        case $opentsdb::package_source {
          /^http/: {
            exec {
              "wget opentsdb package":
                command => "wget -O ${opentsdb::real_package_path} ${opentsdb::package_source}",
                creates => "${opentsdb::real_package_path}",
                unless  => "test -f ${opentsdb::real_package_path}",
                before  => Package['opentsdb']
            }
          }
          /^puppet/: {
            file {
              'opentsdb package':
                path    => "${opentsdb::real_package_path}",
                ensure  => $opentsdb::manage_file,
                source  => $opentsdb::package_source,
                before  => Package['opentsdb']
            }
          }
          default: {}
        }
      }

      package { 'opentsdb':
        ensure    => $opentsdb::manage_package,
        name      => $opentsdb::package,
        provider  => $opentsdb::real_package_provider,
        source    => $opentsdb::real_package_path,
        noop      => $opentsdb::bool_noops,
      }
    }

    source: {
      if $opentsdb::bool_create_user == true {
        require opentsdb::user
      }
      puppi::netinstall { 'netinstall_opentsdb':
        url                 => $opentsdb::real_install_source,
        destination_dir     => $opentsdb::install_destination,
        owner               => $opentsdb::process_user,
        group               => $opentsdb::process_user,
        noop                => $opentsdb::bool_noops,
        postextract_command => $opentsdb::real_install_postcommand,
      }

      file { 'opentsdb_link':
        ensure => "${opentsdb::home}" ,
        path   => "${opentsdb::install_destination}/opentsdb",
        noop   => $opentsdb::bool_noops,
      }
    }

    default: { }

  }
}
