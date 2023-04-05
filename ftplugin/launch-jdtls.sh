#!/bin/sh

JAR="/opt/homebrew/Cellar/jdtls/1.21.0/libexec/plugins/org.eclipse.equinox.launcher_*.jar"
JAVA_HOME="$HOME/.sdkman/candidates/java/17.0.5-zulu"
GRADLE_HOME=$HOME/.sdkman/candidates/gradle $JAVA_HOME/bin/java \
-Declipse.application=org.eclipse.jdt.ls.core.id1 \
-Dosgi.bundles.defaultStartLevel=4 \
-Declipse.product=org.eclipse.jdt.ls.core.product \
-Dlog.protocol=true \
-Dlog.level=ALL \
-Xms1g \
-Xmx2G \
-jar $(echo "$JAR") \
-configuration "/opt/homebrew/Cellar/jdtls/1.18.0/libexec/config_mac" \
-data "${1:-$HOME/eclipse-workspace}" \
--add-modules=ALL-SYSTEM \
--add-opens java.base/java.util=ALL-UNNAMED \
