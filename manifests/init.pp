class opentsdb ( ) {
  Class['hbase'] ->
  class { 'opentsdb::install': } ->
  class { 'opentsdb::config': } ~>
  class { 'opentsdb::service': }
}
