# Make it all nice and fresh
sudo apt-get -y update
sudo apt-get -y upgrade

# Install puppet
sudo apt-get -y install puppet puppet-common facter

# Run puppet
sudo puppet apply --verbose --trace --summarize /etc/puppet/manifests/site.pp
