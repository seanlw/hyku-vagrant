###
# BASICS
###

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

# Update
apt-get -y update
apt-get -y upgrade

# Install needed packages
apt-get -y install build-essential libreadline6-dev zlib1g-dev libyaml-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev cmake bison byacc cscope ctags cvs diffstat doxygen flex gfortran gettext git indent intltool libtool patch patchutils rcs subversion swig systemtap libncurses5-dev pkg-config sqlite3 git-core libgmp3-dev libreadline-dev libgdbm-dev libmysqlclient-dev nodejs libcurl4-openssl-dev apache2-dev libapr1-dev libaprutil1-dev ffmpeg mediainfo openjdk-8-jdk default-jre default-jdk tomcat7 lsof apache2 libsqlite3-dev gnupg2 redis-server postgresql libpq-dev imagemagick unzip ghostscript libreoffice libopenjpeg-dev libpng12-dev libtiff5-dev zookeeper zookeeperd
