#!/usr/bin/env bash
set -euo pipefail

# Cài nginx nếu chưa có
if ! command -v nginx >/dev/null 2>&1; then
  echo "Installing nginx..."
  export DEBIAN_FRONTEND=noninteractive
  apt-get update -y
  apt-get install -y nginx
fi

# Dọn webroot cũ để tránh file thừa giữa các lần deploy
rm -rf /var/www/portfolio
mkdir -p /var/www/portfolio
