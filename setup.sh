#!/bin/sh

if [ ! -f "nodebb.installed" ]; then
    echo {\
        \"url\": \"$NB_URL\",\
        \"port\": \"$NB_PORT\",\
        \"secret\": \"$NB_SECRET\",\
        \"database\": \"$NB_DATABASE\",\
        \"mongo:host\": \"$NB_MONGO_HOST\",\
        \"mongo:port\": \"$NB_MONGO_PORT\",\
        \"mongo:username\": \"$NB_MONGO_USERNAME\",\
        \"mongo:password\": \"$NB_MONGO_PASSWORD\",\
        \"mongo:database\": \"$NB_MONGO_DATABASE\",\
        \"redis:host\": \"$NB_REDIS_HOST\",\
        \"redis:port\": \"$NB_REDIS_PORT\",\
        \"redis:password\": \"$NB_REDIS_PASSWORD\",\
        \"redis:database\": \"$NB_REDIS_DATABASE\",\
        \"admin:username\": \"$NB_ADMIN_USERNAME\",\
        \"admin:email\": \"$NB_ADMIN_EMAIL\",\
        \"admin:password\": \"$NB_ADMIN_PASSWORD\",\
        \"admin:password:confirm\": \"$NB_ADMIN_PASSWORD\"\
        } > setup.json
    ADMINCONF=`cat setup.json`
    echo "Setiing up nodebb..."
    node app.js --setup="$ADMINCONF"
    echo "Setup complete!"
    touch nodebb.installed
fi
