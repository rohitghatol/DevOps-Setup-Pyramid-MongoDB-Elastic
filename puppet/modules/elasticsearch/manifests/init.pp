class elasticsearch {

  require elasticsearch::params

  Exec {
    path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/","/usr/local/bin" ],
  }

  exec {'Download elasticsearch':
    command=>"wget $elasticsearch::params::elasticsearch_download_url",
    cwd=>"/tmp",
    creates=>"/tmp/$elasticsearch::params::elasticsearch_deb_file_name"
  }


  package { "install elasticsearch":
    provider => dpkg,
    ensure => installed,
    source => "/tmp/$elasticsearch::params::elasticsearch_deb_file_name"
  }
}
