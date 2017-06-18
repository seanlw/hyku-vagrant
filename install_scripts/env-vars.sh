############
# Environment Variables
############

echo "Installing Environment Variables"

cat <<EOT >> /etc/environment
RDS_DB_NAME=hyku
RDS_USERNAME=ubuntu
RDS_PASSWORD=ubuntu
DATABASE_URL=postgresql://ubuntu:ubuntu@localhost/hyku
FEDORA_URL=http://localhost:8984/fedora4/rest
SOLR_URL=http://localhost:8983/solr/hyku
SETTINGS__ACTIVE_JOB__QUEUE_ADAPTER=sidekiq
SETTINGS__SOLR__URL=http://localhost:8983/solr/
SETTINGS__ZOOKEEPER__CONNECTION_STR=localhost:2181/configs
SETTINGS__FITS_PATH=/opt/fits/fits.sh
RAILS_CACHE_STORE_URL=memcache
SECRET_KEY_BASE=jfiea90832fj90qnv
RAILS_ENV=production
EOT

source /etc/environment
su - ubuntu -c "source /etc/environment"

echo "Done"
