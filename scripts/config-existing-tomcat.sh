#!/bin/bash

export JAVA_HOME=/opt/java
export JRE_HOME=/opt/java/jre
export PATH=$PATH:/opt/java/bin:/opt/java/jre/bin

adduser -g 99 -c "Tomcat Service Account" -s /bin/bash -d /opt/tomcat tomcat
echo "export CATALINA_HOME=\"/opt/tomcat\"" >> ~/.bashrc
source ~/.bashrc
chown -R tomcat tomcat/

su tomcat <<'EOF'
/opt/tomcat/bin/startup.sh
EOF

# keep server running
/usr/bin/tail -f /dev/null
