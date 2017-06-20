############
# Dnsmasq
############

###
# Dnsmasq is used for testing/development. May not need it for production env.
###
echo "Install Dnsmasq"

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

echo "address=/localhost/127.0.0.1" > /etc/dnsmasq.d/localhost.conf

sed -i -e 's/#prepend domain-name-servers 127.0.0.1;/prepend domain-name-servers 127.0.0.1;/' /etc/dhcp/dhclient.conf

service dnsmasq restart
dhclient

echo "Done"
