#!/bin/bash

IDEA_VER_DATE="2023.3.3"

ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g')
if [ "$ARCH" == "arm64" ] ; then
  IDEA_VER_DATE=$IDEA_VER_DATE"-aarch64"
fi	
 echo $IDEA_VER_DATE

cd /tmp

# wget -q -O idea.tar.gz "https://download.jetbrains.com.cn/idea/ideaIU-${IDEA_VER_DATE}.tar.gz"
# tar -xzf idea.tar.gz -C /opt
# mv /opt/idea-* /opt/idea

cp $INST_SCRIPTS/idea/idea.desktop $HOME/Desktop/
cp $INST_SCRIPTS/idea/idea.desktop /usr/share/applications/

cp $INST_SCRIPTS/idea/jetbra $HOME/jetbra

chmod +x $HOME/jetbra/scripts/*.sh

# ./opt/jetbra/scripts/install.sh

#rm -rf /tmp/idea.tar.gz
