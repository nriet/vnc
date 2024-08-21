#!/bin/bash

IDEA_VER_DATE="2023.3.3-aarch64"

cd /opt
wget -q -O idea.tar.gz "https://download.jetbrains.com.cn/idea/ideaIU-${IDEA_VER_DATE}.tar.gz"

idea_ICON="/opt/idea/plugins/$(ls /opt/idea/plugins/ | grep -m 1 org.idea.platform_)/idea.png"
sed -i "s#idea.png#${idea_ICON}#" $INST_SCRIPTS/idea/idea.desktop
cp $INST_SCRIPTS/idea/idea.desktop $HOME/Desktop/
cp $INST_SCRIPTS/idea/idea.desktop /usr/share/applications/

mv $INST_SCRIPTS/idea/jetbra /opt/jetbra

chmod +x /opt/jetbra/scripts/install.sh

./opt/jetbra/scripts/install.sh

rm -rf /tmp/idea.tar.gz
