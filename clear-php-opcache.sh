#!/bin/sh

WEBDIR=/data/var/www/sites/default/
RANDOM_NAME=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20)

if [[ $HOSTNAME == "vagrant" ]]
then
  WEBDIR=/var/www/sites/default/
fi

# Create temporary script
echo "<?php opcache_reset(); ?>" >> ${WEBDIR}${RANDOM_NAME}.php

# Run it
curl http://localhost/${RANDOM_NAME}.php

# Remove it
rm ${WEBDIR}${RANDOM_NAME}.php