############
# Environment Variables
############

echo "Installing Environment Variables"

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

cp -f $SHARED_DIR/config/env-vars.conf /etc/default/hyku

echo ". /etc/default/hyku" >> /etc/apache2/envvars
echo "source /etc/default/hyku" >> $HOME_DIR/.profile

echo "Done"
