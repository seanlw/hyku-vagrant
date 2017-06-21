############
# Fits
############

echo "Installing fits"

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

if [ ! -f "$DOWNLOAD_DIR/fits-1.0.5.zip" ]; then
  echo -n "Downloading fits 1.0.5..."
  wget -q "http://projects.iq.harvard.edu/files/fits/files/fits-1.0.5.zip" -O "$DOWNLOAD_DIR/fits-1.0.5.zip"
  echo "Done"
fi

cp $DOWNLOAD_DIR/fits-1.0.5.zip /tmp
cd /tmp
unzip -q fits-1.0.5.zip
mv fits-1.0.5 /opt/fits
chmod a+x /opt/fits/fits.sh
rm -f /opt/fits/tools/mediainfo/linux/libmediainfo.so.0
rm -f rm /opt/fits/tools/mediainfo/linux/libzen.so.0

echo "Done"
