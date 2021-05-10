server {
    listen 80 default_server;

    server_name _;

    return 301 https://$host$request_uri;
}
server {
    listen              443 ssl;
    server_name         nzdw392v.nz.unix.test;
    ssl                 on;
    ssl_certificate     /etc/ssl/certs/netbox.crt;
    ssl_certificate_key /etc/ssl/private/netbox.key;
    ssl_protocols       TLSv1.2;
    ssl_prefer_server_ciphers   on;
    ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM';

    location /static/ {
        alias /opt/netbox/netbox/static/;
    }

    location / {
        proxy_set_header Host $host;
        proxy_pass http://127.0.0.1:8001;
    }
}