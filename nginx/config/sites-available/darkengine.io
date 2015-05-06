# Main site config

server {
	listen 80;
	listen [::]:80;
	server_name    darkengine.io;
	return         301 https://$server_name$request_uri;
}

server {
	server_name    darkengine.io;

	# SSL configuration
	listen 443 ssl;
	listen [::]:443 ssl;

	ssl on;
	ssl_certificate /etc/nginx/ssl/darkengine.io/darkengine.io.chain.pem;
	ssl_certificate_key /etc/nginx/ssl/darkengine.io/darkengine.io.key;

	include snippets/strong-ssl.conf;

	ssl_dhparam /etc/nginx/ssl/dhparam.pem;
	ssl_trusted_certificate /etc/nginx/ssl/darkengine.io/ocsp_chain.pem;

	location / {
		proxy_pass http://www_nginx_1;
	}
}

