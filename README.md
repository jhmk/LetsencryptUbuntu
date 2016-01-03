# LetsencryptUbuntu

sudo apt-get update -y && sudo apt-get dist-upgrade -y && sudo apt-get upgrade -y

sudo apt-get install git 

sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt

cd /opt/letsencrypt/

./letsencrypt-auto certonly -a webroot --agree-tos --renew-by-default --webroot-path=/usr/share/nginx/html -d DOMAIN -d www.DOMAIN

sudo nano /etc/nginx/sites-avaible/default

	ssl on;
	ssl_certificate /etc/letsencrypt/live/DOMAIN/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/DOMAIN/privkey.pem;



	#Stapling
	ssl_stapling on;
  	ssl_stapling_verify on;
	ssl_trusted_certificate /etc/letsencrypt/live/DOMAIN/chain.pem;
