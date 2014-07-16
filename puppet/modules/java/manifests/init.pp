class java {

  require java::params

  Exec {
    path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/","/usr/local/bin" ],
  }

  exec {'apt update for java':
    command=>"apt-get update",
  }


  package {'install java':
    ensure => present,
    name   => $java::params::java_package_name,
    require=> Exec["apt update for java"]
  }
}
