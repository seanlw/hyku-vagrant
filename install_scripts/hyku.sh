############
# Hyku
############

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

if [ ! -f "$DOWNLOAD_DIR/fits-1.0.5.zip" ]; then
  echo -n "Downloading fits 1.0.5..."
  wget -q "http://projects.iq.harvard.edu/files/fits/files/fits-1.0.5.zip" -O "$DOWNLOAD_DIR/fits-1.0.5.zip"
  echo "Done"
fi

echo "Installing fits..."
sudo cp $DOWNLOAD_DIR/fits-1.0.5.zip /tmp
cd /tmp
sudo unzip -q fits-1.0.5.zip
sudo mv fits-1.0.5 /opt/fits
sudo chmod a+x /opt/fits/fits.sh
sudo rm -f /opt/fits/tools/mediainfo/linux/libmediainfo.so.0
sudo rm -f rm /opt/fits/tools/mediainfo/linux/libzen.so.0
echo "Done"

echo "Installing Hyku"
sudo mkdir -p /var/www/hyku
sudo chown -R ubuntu:ubuntu /var/www/hyku

cd $HOME_DIR
git clone https://github.com/samvera-labs/hyku.git
mv $HOME_DIR/hyku/* /var/www/hyku
rm -Rf $HOME_DIR/hyku

sudo -u postgres psql -c "CREATE USER ubuntu WITH PASSWORD 'ubuntu' CREATEDB;"

##
#  Need to export environment variables since /etc/environment doesn't kick in
#  at this point in provisioning. This is only needed for vagrant installs.
##
export RDS_DB_NAME=hyku
export RDS_USERNAME=ubuntu
export RDS_PASSWORD=ubuntu
export DATABASE_URL=postgresql://ubuntu:ubuntu@localhost/hyku
export FEDORA_URL=http://localhost:8984/fedora4/rest
export SOLR_URL=http://localhost:8983/solr/hyku
export SETTINGS__ACTIVE_JOB__QUEUE_ADAPTER=sidekiq
export SETTINGS__SOLR__URL=http://localhost:8983/solr/
export SETTINGS__ZOOKEEPER__CONNECTION_STR=localhost:2181/configs
export SETTINGS__FITS_PATH=/opt/fits/fits.sh
export RAILS_CACHE_STORE_URL=memcache
export SECRET_KEY_BASE=jfiea90832fj90qnv
export RAILS_ENV=production

cd /var/www/hyku
gem install bundler -q
bundle install

bundle exec rake assets:precompile
bundle exec rake db:setup

sudo service apache2 restart

sudo cp $SHARED_DIR/config/sidekiq.init /etc/init.d/sidekiq
sudo chmod 755 /etc/init.d/sidekiq
sudo update-rc.d sidekiq defaults
sudo update-rc.d sidekiq enable
