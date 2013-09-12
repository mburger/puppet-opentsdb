# Puppet module: opentsdb

This is a Puppet module for opentsdb based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Markus Burger (based on the template provided by Alessandro Franceschi)

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.


## USAGE - Basic management

* Install opentsdb with default settings

        class { 'opentsdb': }

* Install a specific version of opentsdb package

        class { 'opentsdb':
          version => '1.0.1',
        }

* Disable opentsdb service.

        class { 'opentsdb':
          disable => true
        }

* Remove opentsdb package

        class { 'opentsdb':
          absent => true
        }

* Enable auditing without without making changes on existing opentsdb configuration *files*

        class { 'opentsdb':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'opentsdb':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'opentsdb':
          source => [ "puppet:///modules/example42/opentsdb/opentsdb.conf-${hostname}" , "puppet:///modules/example42/opentsdb/opentsdb.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'opentsdb':
          source_dir       => 'puppet:///modules/example42/opentsdb/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'opentsdb':
          template => 'example42/opentsdb/opentsdb.conf.erb',
        }

* Automatically include a custom subclass

        class { 'opentsdb':
          my_class => 'example42::my_opentsdb',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'opentsdb':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'opentsdb':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'opentsdb':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'opentsdb':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


## CONTINUOUS TESTING

Travis {<img src="https://travis-ci.org/example42/puppet-opentsdb.png?branch=master" alt="Build Status" />}[https://travis-ci.org/example42/puppet-opentsdb]
