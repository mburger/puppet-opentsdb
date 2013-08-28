class opentsdb::config ( ) {
  
  file {
    
    '/opt/opentsdb/opentsdb.conf':
      ensure  => present, 
      owner   => root,
      group   => root,
      mode    => 644,
      source  => 'puppet:///modules/opentsdb/opentsdb.conf';
  }
  
  exec {
    'create_tables':
      command => 'env COMPRESSION=NONE HBASE_HOME=/opt/hbase-0.94.10-security ./src/create_table.sh',
      unless  => 'echo "exists \'tsdb\'" | /opt/hbase-0.94.10-security/bin/hbase shell | grep "does exists"'
  }
  
  
}