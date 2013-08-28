class opentsdb::install ( ) {
  
  file {
    '/opt/opentsdb-current.deb':
      source => 'puppet:///modules/opentsdb/optsdb-2.0.0_all.deb'
  }
  
  package {
    'opentsdb':
      ensure => present,
      source => '/opt/opentsdb-current.deb',
      provider => 'dpkg',
      require => File['/opt/opentsdb-current.deb']
  }
}
