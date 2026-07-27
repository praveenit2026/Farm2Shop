#!/bin/bash
# Render provides PORT env var — update Tomcat server.xml to use it
PORT=${PORT:-10000}

echo "Starting Tomcat on port $PORT"

# Replace the Connector port in server.xml with Render's PORT
sed -i "s/port=\"8080\"/port=\"$PORT\"/g" /usr/local/tomcat/conf/server.xml

# Start Tomcat
exec /usr/local/tomcat/bin/catalina.sh run
