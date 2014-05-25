# ssh pi@192.168.1.4

# Install git
sudo apt-get -y install git

# Clone puppet repo to /etc/puppet
sudo git clone URL /etc/puppet

sudo /etc/puppet/setup.sh

# Make it all nice and fresh
sudo apt-get -y update
sudo apt-get -y upgrade

# Install puppet
sudo apt-get -y install puppet puppet-common facter

# Run puppet
sudo puppet apply --verbose --trace --summarize /etc/puppet/manifests/site.pp

