############
# Ruby
############

echo "Installing Ruby"

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

cd $HOME_DIR
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source $HOME_DIR/.rvm/scripts/rvm

rvm install 2.3.1
rvm  --default use 2.3.1

echo "Done"
