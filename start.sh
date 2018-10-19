#!/bin/sh

# link configuration files for apache and cosign
# from volume from preloaded secret.
if [ -f /secrets/httpd/httpd.conf ];
then
    ln -sf /secrets/httpd/httpd.conf /usr/local/apache2/conf/httpd.conf
fi

if [ -f /secrets/httpd/httpd-cosign.conf ];
then
ln -sf /secrets/httpd/httpd-cosign.conf /usr/local/apache2/conf/extra/httpd-cosign.conf
fi

if [ -f /secrets/httpd/httpd-ssl.conf ];
then
ln -sf /secrets/httpd/httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf
fi

# copy certs from secret volume to a location that can be written to.
#mkdir /usr/local/apache2/certs/
if [ -e /secrets/certs ];
then
cp /secrets/certs/* /usr/local/apache2/certs/
fi

# Rehash command needs to be run before starting apache.
#c_rehash /usr/local/apache2/certs

# Redirect logs to stdout and stderr for docker reasons.
ln -sf /dev/stdout /usr/local/apache2/logs/access_log
ln -sf /dev/stderr /usr/local/apache2/logs/error_log

/usr/local/apache2/bin/httpd -DFOREGROUND 
