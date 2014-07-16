class mongodb {

require mongodb::params

Exec {
  path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ],
}



  exec {'update apt key':
    command=> "apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10",
  }

  exec {'update apt sources':
    command=>"echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list",
    require=>Exec["update apt key"],
  }

  exec {'apt update':
    command=>"apt-get update",
    require=>Exec["update apt sources"]
  }

  package {'mongodb::package':
    ensure => $mongodb::params::mongodb_version,
    name   => $mongodb::params::mongodb_package_name,
    require=> Exec["apt update"]
  }
}