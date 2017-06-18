############
# Fedora 4
############

echo "Installing Fedora."

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

if [ ! -f "$DOWNLOAD_DIR/fcrepo-webapp-4.7.1.war" ]; then
  echo -n "Downloading Fedora 4..."
  wget -q "https://github.com/fcrepo4/fcrepo4/releases/download/fcrepo-4.7.1/fcrepo-webapp-4.7.1.war" -O "$DOWNLOAD_DIR/fcrepo-webapp-4.7.1.war"
  echo " done"
fi

mkdir -p /var/hyku/fedora
chown tomcat7:tomcat7 /var/hyku/fedora

cp -f $DOWNLOAD_DIR/fcrepo-webapp-4.7.1.war /var/lib/tomcat7/webapps/fedora4.war
cp -f $SHARED_DIR/config/server.xml /etc/tomcat7/server.xml
cp -f $SHARED_DIR/config/tomcat-users.xml /etc/tomcat7/tomcat-users.xml

echo "JAVA_OPTS=\"\${JAVA_OPTS} -Dfcrepo.modeshape.configuration=classpath:/config/file-simple/repository.json -Dfcrepo.home=/var/hyku/fedora/\"" >> /etc/default/tomcat7

service tomcat7 restart
