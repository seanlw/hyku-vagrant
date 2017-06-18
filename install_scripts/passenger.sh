############
# Passenger
############

echo "Installing Apache Passenger and Ruby"

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

cd $HOME_DIR
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -q -L https://get.rvm.io | bash -s stable --ruby=2.3.1
source $HOME_DIR/.rvm/scripts/rvm

rvm use 2.3.1
rvm  --default use 2.3.1

echo "Installing passenger..."
gem install passenger -v 5.1.4 -q
passenger-install-apache2-module --auto

sudo cp -f $SHARED_DIR/config/passenger.conf /etc/apache2/mods-available/passenger.conf

sudo a2enmod rewrite
sudo ln -s /etc/apache2/mods-available/passenger.conf /etc/apache2/mods-enabled/passenger.conf

# Virtual Host config
sudo rm /etc/apache2/sites-enabled/000-default.conf
sudo cp -f $SHARED_DIR/config/hyku.conf /etc/apache2/sites-available/hyku.conf
sudo a2ensite hyku
