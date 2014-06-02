# motd, aliases
include baseconfig

# mpd
# https://github.com/ajjahn/puppet-mpd
# http://kaffeeringe.de/703/fernsteuerte-musik-per-mpd-und-android/
# http://www.raspberrypi.org/forums/viewtopic.php?f=9&t=6056
class { 'mpd::server':
  music_directory => '/media/usb-music/music',
  bind_to_address => '192.168.1.4',
  mixer_type      => 'software',
  volume_normalization => "yes",
}

exec { "load_alpha_audio_driver":
  command => "/sbin/modprobe snd_bcm2835",
}

# Mount USB HDD
# http://jankarres.de/2013/01/raspberry-pi-usb-stick-und-usb-festplatte-einbinden/
file { [ '/media', '/media/usb-music' ]:
  ensure => 'directory'
}
# http://awaseroot.wordpress.com/2012/11/03/puppet-module-for-etcfstab-mounts/
mount { "/media/usb-music":
  device  => "LABEL=MUSIC",
  fstype  => "vfat",
  ensure  => "mounted",
  options => "defaults,rw",
  atboot  => "true",
}

# Standby HDD
include hdparm
# http://unix.stackexchange.com/questions/58628/why-does-drive-not-enter-standby-mode-when-using-hdparm-s
# http://linuxundich.de/hardware/festplatten-automatisch-im-betrieb-in-den-standby-schalten/
#sudo hdparm -C /dev/sda
#sudo hdparm -y /dev/sda
#sudo hdparm -I /dev/sda
# sudo smartctl --offlineauto=off /dev/sda
package { 'smartmontools':
  ensure => 'latest',
}



# ln -s /media/usb0/flunder/MusikFrieder /var/lib/mpd/music
# mpd::server => follow_inside_symlinks
#
# Wechselmedien automatisch mounten
# sudo apt-get install usbmount
# http://www.instructables.com/id/Raspberry-Pi-Wi-Fi-Media-Server/step8/Install-USBmount/
#package { "usbmount":
#  ensure => "latest"
#}
#Problem, dass usbmount nach restart noch nicht läuft und das medium
#deshalb nicht eingebunden wird.

