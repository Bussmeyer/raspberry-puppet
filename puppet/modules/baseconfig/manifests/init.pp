# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update';
  }

  #host { 'hostmachine':
  #  ip => '192.168.0.1';
  #}

  file {
    '/home/pi/.bashrc':
      owner => 'pi',
      group => 'pi',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/bashrc';
  }

  file { '/etc/motd':
    content => "Welcome to the Pi!\nManaged by Puppet.\n----------------\n----------------\n",
  }
}
