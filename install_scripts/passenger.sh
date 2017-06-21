############
# Passenger
############

echo "Installing Apache Passenger"

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

cd $HOME_DIR
gem install passenger -v 5.1.4 -q
passenger-install-apache2-module --auto

sudo cp -f $SHARED_DIR/config/passenger.conf /etc/apache2/mods-available/passenger.conf

sudo a2enmod rewrite
sudo ln -s /etc/apache2/mods-available/passenger.conf /etc/apache2/mods-enabled/passenger.conf

# Virtual Host config
sudo rm /etc/apache2/sites-enabled/000-default.conf
sudo cp -f $SHARED_DIR/config/hyku.conf /etc/apache2/sites-available/hyku.conf
sudo a2ensite hyku

echo "Done"
