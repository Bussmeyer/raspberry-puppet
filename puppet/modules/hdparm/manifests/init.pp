class hdparm () {
  package { 'hdparm':
    ensure => 'latest',
  }

  file { '/etc/hdparm.conf':
    ensure => present,
    owner => "root",
    group => "root",
    mode => 0644,
    content => template("${module_name}/hdparm.conf.erb")
  }
}