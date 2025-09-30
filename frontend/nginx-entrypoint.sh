#!/bin/sh
envsubst '$API_URL' < /usr/share/nginx/html/app.js > /usr/share/nginx/html/app.js.tmp
mv /usr/share/nginx/html/app.js.tmp /usr/share/nginx/html/app.js

cat > /etc/nginx/conf.d/default.conf << EOF
server {
    listen 80;
    server_name ${SERVER_NAME};
    
    location /api/tasks {
        proxy_pass ${API_URL_BACK};
        
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header X-Forwarded-Host \$server_name;
        
        proxy_connect_timeout 30s;
        proxy_send_timeout 30s;
        proxy_read_timeout 30s;
    }
    
    location / {
        root /usr/share/nginx/html;
        index index.html;
        try_files \$uri \$uri/ /index.html;
    }
}
EOF

echo "=== Generated nginx config ==="
cat /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
