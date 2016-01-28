#!/bin/bash
# Renew Let's Encrypt SSL cert



cd /opt/letsencrypt/
./letsencrypt-auto --config /etc/letsencrypt/cli.ini -d DOMAIN -d www.DOMAIN certonly

# content of /etc/letsencrpyt/cli.ini
# authenticator = webroot
# webroot-path = /usr/share/nginx/html/
# server = https://acme-v01.api.letsencrypt.org/directory
# renew-by-default = true
# agree-dev-preview
# agree-tos 
# email = DOMAINADMIN

if [ $? -ne 0 ]
 then
        ERRORLOG=`tail /var/log/letsencrypt/letsencrypt.log`
        echo -e "The Lets Encrypt Cert has not been renewed! \n \n" $ERRORLOG | mail -s "Lets Encrypt Cert Alert" postmaster@yourdomain.com
 else
        service nginx reload
fi

