# = Class: opentsdb
#
# This is the main opentsdb class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, opentsdb class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $opentsdb_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, opentsdb main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $opentsdb_source
#
# [*source_dir*]
#   If defined, the whole opentsdb configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $opentsdb_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $opentsdb_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, opentsdb main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $opentsdb_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $opentsdb_options
#
# [*service_autorestart*]
#   Automatically restarts the opentsdb service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $opentsdb_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $opentsdb_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $opentsdb_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $opentsdb_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for opentsdb checks
#   Can be defined also by the (top scope) variables $opentsdb_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $opentsdb_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $opentsdb_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $opentsdb_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $opentsdb_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for opentsdb port(s)
#   Can be defined also by the (top scope) variables $opentsdb_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling opentsdb. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $opentsdb_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $opentsdb_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $opentsdb_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $opentsdb_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: undef
#
# Default class params - As defined in opentsdb::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of opentsdb package
#
# [*service*]
#   The name of opentsdb service
#
# [*service_status*]
#   If the opentsdb service init script supports status argument
#
# [*process*]
#   The name of opentsdb process
#
# [*process_args*]
#   The name of opentsdb arguments. Used by puppi and monitor.
#   Used only in case the opentsdb process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user opentsdb runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $opentsdb_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $opentsdb_protocol
#
#
# See README for usage patterns.
#
class opentsdb (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' ),
  $install             = params_lookup( 'install' ),
  $install_source      = params_lookup( 'install_source' ),
  $install_destination = params_lookup( 'install_destination' ),
  $install_prerequisites  = params_lookup( 'install_prerequisites' ),
  $install_postcommand = params_lookup( 'install_postcommand' ),
  $create_user         = params_lookup( 'create_user' ),
  $package               = params_lookup( 'package' ),
  $package_source        = params_lookup( 'package_source' ),
  $package_provider      = params_lookup( 'package_provider' ),
  $package_path          = params_lookup( 'package_path' ),
  ) inherits opentsdb::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_install_prerequisites=any2bool($install_prerequisites)
  $bool_create_user=any2bool($create_user)

  ### Definition of some variables used in the module
  $manage_package = $opentsdb::bool_absent ? {
    true  => 'absent',
    false => $opentsdb::install ? {
      package => $opentsdb::package_source ? {
        ''      => $opentsdb::version,
        default => $::operatingsystem ? {
          /(?i:Debian|Ubuntu|Mint)/ => 'present',
          default                   => $opentsdb::version,
        },
      },
      default => $opentsdb::version,
    },
  }

  $manage_service_enable = $opentsdb::bool_disableboot ? {
    true    => false,
    default => $opentsdb::bool_disable ? {
      true    => false,
      default => $opentsdb::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $opentsdb::bool_disable ? {
    true    => 'stopped',
    default =>  $opentsdb::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $opentsdb::bool_service_autorestart ? {
    true    => Service[opentsdb],
    false   => undef,
  }

  $manage_file = $opentsdb::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $opentsdb::bool_absent == true
  or $opentsdb::bool_disable == true
  or $opentsdb::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $opentsdb::bool_absent == true
  or $opentsdb::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $opentsdb::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $opentsdb::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $opentsdb::source ? {
    ''        => undef,
    default   => $opentsdb::source,
  }

  $manage_file_content = $opentsdb::template ? {
    ''        => undef,
    default   => template($opentsdb::template),
  }

  ### Internal vars depending on user's input
  $real_install_source = $opentsdb::install_source ? {
    ''      => "https://github.com/OpenTSDB/opentsdb/archive/${opentsdb::version}.zip",
    default => $opentsdb::install_source,
  }

  $created_dirname = "opentsdb-${opentsdb::version}"
  $home = "${opentsdb::install_destination}/${opentsdb::created_dirname}"

  $real_config_file = $opentsdb::config_file ? {
    ''      => $opentsdb::install ? {
      package => '/etc/opentsdb/opentsdb.conf',
      default => "${opentsdb::home}/opentsdb.conf",
    },
    default => $opentsdb::config_file,
  }

  $package_filename = url_parse($opentsdb::package_source, 'filename')
  $real_package_path = $opentsdb::package_path ? {
    ''      => $opentsdb::package_source ? {
      ''      => undef,
      default => "${opentsdb::install_destination}/${opentsdb::package_filename}",
    },
    default => $opentsdb::package_path,
  }

  $real_package_provider = $opentsdb::package_provider ? {
    ''      => $opentsdb::package_source ? {
      ''      => undef,
      default => $::operatingsystem ? {
          /(?i:Debian|Ubuntu|Mint)/ => 'dpkg',
          default                   => undef,
      },
    },
    default => $opentsdb::package_provider,
  }

  $real_install_postcommand = $opentsdb::install_postcommand ? {
    ''      => "cd ${opentsdb::home} && ./build.sh",
    default => $opentsdb::install_postcommand,
  }

  ### Managed resources

  if $opentsdb::bool_install_prerequisites {
    class { 'opentsdb::prerequisites':
    }
  }

  class { 'opentsdb::install': }

  class { 'opentsdb::service':
    require => Class['opentsdb::install'],
  }

  class { 'opentsdb::config':
    notify  => $opentsdb::manage_service_autorestart,
    require => Class['opentsdb::install'],
  }

  ### Include custom class if $my_class is set
  if $opentsdb::my_class {
    include $opentsdb::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $opentsdb::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'opentsdb':
      ensure    => $opentsdb::manage_file,
      variables => $classvars,
      helper    => $opentsdb::puppi_helper,
      noop      => $opentsdb::noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $opentsdb::bool_monitor == true {
    if $opentsdb::port != '' {
      monitor::port { "opentsdb_${opentsdb::protocol}_${opentsdb::port}":
        protocol => $opentsdb::protocol,
        port     => $opentsdb::port,
        target   => $opentsdb::monitor_target,
        tool     => $opentsdb::monitor_tool,
        enable   => $opentsdb::manage_monitor,
        noop     => $opentsdb::noops,
      }
    }
    if $opentsdb::service != '' {
      monitor::process { 'opentsdb_process':
        process  => $opentsdb::process,
        service  => $opentsdb::service,
        pidfile  => $opentsdb::pid_file,
        user     => $opentsdb::process_user,
        argument => $opentsdb::process_args,
        tool     => $opentsdb::monitor_tool,
        enable   => $opentsdb::manage_monitor,
        noop     => $opentsdb::noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $opentsdb::bool_firewall == true and $opentsdb::port != '' {
    firewall { "opentsdb_${opentsdb::protocol}_${opentsdb::port}":
      source      => $opentsdb::firewall_src,
      destination => $opentsdb::firewall_dst,
      protocol    => $opentsdb::protocol,
      port        => $opentsdb::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $opentsdb::firewall_tool,
      enable      => $opentsdb::manage_firewall,
      noop        => $opentsdb::noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $opentsdb::bool_debug == true {
    file { 'debug_opentsdb':
      ensure  => $opentsdb::manage_file,
      path    => "${settings::vardir}/debug-opentsdb",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $opentsdb::noops,
    }
  }

}
