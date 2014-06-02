ssh pi@192.168.1.4 'sudo rm -rf /tmp/puppet /etc/puppet'
scp -r puppet/ pi@192.168.1.4:/tmp/
ssh pi@192.168.1.4 'sudo cp -r /tmp/puppet /etc/'
ssh pi@192.168.1.4 'sudo puppet apply --verbose --trace --summarize /etc/puppet/manifests/site.pp'