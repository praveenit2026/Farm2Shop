#!/bin/bash
# Render provides PORT env var — update Tomcat server.xml to use it
PORT=${PORT:-10000}

# Restrict JVM Heap, Metaspace, and CodeCache for Render Free Tier (512 MB Memory Limit)
export CATALINA_OPTS="-Xms64m -Xmx256m -XX:MaxMetaspaceSize=96m -XX:ReservedCodeCacheSize=48m -XX:+UseG1GC ${CATALINA_OPTS}"

echo "Starting Tomcat on port $PORT with CATALINA_OPTS=$CATALINA_OPTS"

# Replace the HTTP Connector port with Render's PORT and limit worker threads to 50 to conserve stack memory
sed -i "s/port=\"8080\"/port=\"$PORT\" maxThreads=\"50\" minSpareThreads=\"5\"/g" /usr/local/tomcat/conf/server.xml

# Disable Tomcat shutdown port (set to -1) to avoid Render health check warnings
sed -i 's/<Server port="8005" shutdown="SHUTDOWN">/<Server port="-1" shutdown="SHUTDOWN">/' /usr/local/tomcat/conf/server.xml

# Start Tomcat
exec /usr/local/tomcat/bin/catalina.sh run

