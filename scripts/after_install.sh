#!/usr/bin/env bash
set -euo pipefail

# Cấu hình nginx site trỏ vào /var/www/portfolio (port 80)
cat > /etc/nginx/sites-available/portfolio <<'NGINX'
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/portfolio;
    index index.html;
    location / {
        try_files $uri $uri/ =404;
    }
}
NGINX

ln -sf /etc/nginx/sites-available/portfolio /etc/nginx/sites-enabled/portfolio
rm -f /etc/nginx/sites-enabled/default

chown -R www-data:www-data /var/www/portfolio

nginx -t
systemctl enable nginx
systemctl restart nginx
