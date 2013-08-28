class opentsdb::service ( ) {
  
  service{ 'opentsdb':
    ensure => 'running',
    enable => true
  }
}