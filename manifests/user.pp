# Class: opentsdb::user
#
# This class creates opentsdb user
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by opentsdb
#
class opentsdb::user {
  @user { $opentsdb::process_user :
    ensure     => $opentsdb::manage_file,
    comment    => "${opentsdb::process_user} user",
    password   => '!',
    managehome => false,
    home       => $opentsdb::home,
    shell      => '/bin/bash',
  }

  User <| title == $opentsdb::process_user |>

}
