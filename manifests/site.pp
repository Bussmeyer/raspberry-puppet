
# symlink
# ln -s /media/usb0/flunder/MusikFrieder /var/lib/mpd/music
# mpd::server => follow_inside_symlinks
#
# USB Festplatte automatisch mounten
# sudo apt-get install usbmount




# mpd
# https://github.com/ajjahn/puppet-mpd
# http://kaffeeringe.de/703/fernsteuerte-musik-per-mpd-und-android/
# http://www.raspberrypi.org/forums/viewtopic.php?f=9&t=6056
# sudo modprobe snd_bcm2835
class {'mpd::server':
  music_directory => '/media/usb0/flunder/MusikFrieder',
  bind_to_address => '192.168.1.4',
  mixer_type      => 'software',
  volume_normalization => "yes",
}