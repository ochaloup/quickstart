#!/usr/bin/env bash

# This script (postconfigure.sh) is executed during launch of the application server (not during the build)
# This script is expected to be copied to $JBOSS_HOME/extensions/ folder by script install.sh

POSTCONFIGURE_PROPERTIES_FILE="$JBOSS_HOME/extensions/cli.openshift-eap.properties"

if [ ! -f "${JBOSS_HOME}/standalone/configuration/standalone-openshift.xml" ]; then
  sed -i 's/serverConfig=.*/serverConfig=standalone.xml/' "${POSTCONFIGURE_PROPERTIES_FILE}"
fi

echo "Executing ejb-txn-remote-call/server $JBOSS_HOME/extensions/clustering.cli file with properties file: $POSTCONFIGURE_PROPERTIES_FILE."
[ "x$SCRIPT_DEBUG" = "xtrue" ] && cat "$JBOSS_HOME/extensions/clustering.cli"

$JBOSS_HOME/bin/jboss-cli.sh --file=$JBOSS_HOME/extensions/clustering.cli --properties=$POSTCONFIGURE_PROPERTIES_FILE
