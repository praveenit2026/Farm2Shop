#!/bin/bash
# Render provides PORT env var — update Tomcat server.xml to use it
PORT=${PORT:-10000}

echo "Starting Tomcat on port $PORT"

# Replace the HTTP Connector port with Render's PORT
sed -i "s/port=\"8080\"/port=\"$PORT\"/g" /usr/local/tomcat/conf/server.xml

# Disable Tomcat shutdown port (set to -1) to avoid Render health check warnings
sed -i 's/<Server port="8005" shutdown="SHUTDOWN">/<Server port="-1" shutdown="SHUTDOWN">/' /usr/local/tomcat/conf/server.xml

# Start Tomcat
exec /usr/local/tomcat/bin/catalina.sh run
