class pyramid {

  require pyramid::params

  Exec {
    path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/","/usr/local/bin","/tmp" ],
  }

  # Don't need to do this each time in each module
  exec {'apt update for pyramid':
    command=>"apt-get update",
  }

  package { "install pyramid":
    ensure => present,
    name   => $pyramid::params::python_package_name,
    require=> Exec["apt update for pyramid"]
  }

  package { "install libxml2-dev":
    ensure => present,
    name   => "libxml2-dev",
    require=> Package["install pyramid"]
  }

  package { "install libxslt-dev":
    ensure => present,
    name   => "libxslt-dev",
    require=> Package["install libxml2-dev"]
  }

  package { "install zlib1g-dev":
    ensure => present,
    name   => "zlib1g-dev",
    require=> Package["install libxslt-dev"]
  }

  exec {'Download easy_install_setup':
    command=>"wget $pyramid::params::easy_install_download_url",
    cwd=>"/tmp",
    creates=>"/tmp/$pyramid::params::easy_install_file_name",
    require=>Package["install zlib1g-dev"]
  }

  file {"make executable":
    path => "/tmp/$pyramid::params::easy_install_file_name",
    mode => 755,
    require=>Exec["Download easy_install_setup"]
  }

  exec{"Install Easy Install":
    command => "/tmp/$pyramid::params::easy_install_file_name",
    cwd=>"/tmp",
    require=>File["make executable"]
  }

  exec{"Install VirtualEnv":
    command => "easy_install virtualenv",
    require=>Exec["Install Easy Install"]
  }


}