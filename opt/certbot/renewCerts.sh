#!/bin/sh
# This script renews all the Let's Encrypt certificates with a validity < 30 days

if ! /opt/certbot/certbot-auto renew --quiet --no-self-upgrade > /var/log/letsencrypt/renew.log 2>&1 ; then
    echo Automated renewal failed:
    cat /var/log/letsencrypt/renew.log
    exit 1
fi
nginx -t && nginx -s reload
