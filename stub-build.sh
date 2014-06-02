# SSH Keys
# http://www.schlittermann.de/doc/ssh.html
# https://help.github.com/articles/generating-ssh-keys

# Install git
sudo apt-get -y install git

# Clone puppet repo to /etc/puppet
sudo git clone https://github.com/Bussmeyer/raspberry-puppet.git /etc/puppet

# Setup everthing
sudo /etc/puppet/build.sh