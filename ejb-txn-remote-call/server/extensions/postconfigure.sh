#!/usr/bin/env bash

POSTCONFIGURE_PROPERTIES_FILE="$JBOSS_HOME/extensions/cli.kubernetes.properties"
if [ -f "$JBOSS_HOME/standalone/configuration/standalone-openshift.xml" ]; then
  # we are running the JBoss EAP which differs from WildFly by not using 'standalone.xml'
  POSTCONFIGURE_PROPERTIES_FILE="$JBOSS_HOME/extensions/cli.openshift-eap.properties"
fi
echo "Executing cli with properties file: $POSTCONFIGURE_PROPERTIES_FILE"

echo "Executing clustering cli at $JBOSS_HOME/extensions/clustering.cli"
$JBOSS_HOME/bin/jboss-cli.sh --file=$JBOSS_HOME/extensions/clustering.cli --properties=$POSTCONFIGURE_PROPERTIES_FILE
