#!/bin/bash

#修改用户名称
usermod -l nriet kasm-user
sed -i 's/kasm-user/nriet/g' /etc/passwd
sed -i 's/kasm-user/nriet/g' /etc/shadow
mv /home/kasm-user /home/nriet

IDEA_VER_DATE="2023.3.3"

ARCH=$(arch | sed 's/aarch64/arm64/g' | sed 's/x86_64/amd64/g')
if [ "$ARCH" == "arm64" ] ; then
  IDEA_VER_DATE=$IDEA_VER_DATE"-aarch64"
fi	
 echo $IDEA_VER_DATE

cd /tmp
wget -q -O idea.tar.gz "https://download.jetbrains.com.cn/idea/ideaIU-${IDEA_VER_DATE}.tar.gz"

tar -xzf idea.tar.gz -C /tmp

mv /tmp/idea-* /home/nriet/idea

cp $INST_SCRIPTS/idea/idea.desktop /home/nriet/Desktop/
cp $INST_SCRIPTS/idea/idea.desktop /usr/share/applications/

mv $INST_SCRIPTS/idea/jetbra /home/nriet/jetbra

chmod +x /home/nriet/jetbra/scripts/*.sh

rm -rf /tmp/idea.tar.gz
