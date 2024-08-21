#!/bin/bash

IDEA_VER_DATE="2023.3.3-aarch64"

cd /tmp
wget -q -O idea.tar.gz "https://download.jetbrains.com.cn/idea/ideaIU-${IDEA_VER_DATE}.tar.gz"

tar -xzf idea.tar.gz -C /opt

mv /opt/idea-IU-233.11799.241 /opt/idea

idea_ICON="/opt/idea/plugins/$(ls /opt/idea/plugins/ | grep -m 1 org.idea.platform_)/idea.png"
sed -i "s#idea.png#${idea_ICON}#" $INST_SCRIPTS/idea/idea.desktop
cp $INST_SCRIPTS/idea/idea.desktop $HOME/Desktop/
cp $INST_SCRIPTS/idea/idea.desktop /usr/share/applications/

#chmod +x $INST_SCRIPTS/idea/jetbra/scripts/install.sh

#./$INST_SCRIPTS/idea/jetbra/scripts/install.sh

rm -rf /tmp/idea.tar.gz
