#!/bin/bash
# Credits: https://goo.gl/N4Tc2B

###### CONSTANTS ######
target_file=`echo "/etc/systemd/system/"`
curr_usr=`echo $USER`
curr_grp=$curr_usr
fs=`du -k $target_file | cut -f1`
sed "s/username/$curr_usr/;s/groupname/$curr_grp/" content.txt > plexmediaserver.service
#######################

sudo systemctl stop plexmediaserver.service &> /dev/null

if [ ! -f $target_file ]
  then
    sudo touch $target_file
    sudo mv -f plexmediaserver.service $target_file &> /dev/null
    sudo chown -R $curr_usr:$curr_grp /var/lib/plexmediaserver &> /dev/null
    sudo systemctl --system daemon-reload &> /dev/null
    sudo service plexmediaserver start &> /dev/null
elif [ $fs -eq 0 ]
   then
    sudo mv -f plexmediaserver.service $target_file &> /dev/null
    sudo chown -R $curr_usr:$curr_grp /var/lib/plexmediaserver &> /dev/null
    sudo systemctl --system daemon-reload &> /dev/null
    sudo service plexmediaserver start &> /dev/null
else
  sudo mv -f plexmediaserver.service $target_file &> /dev/null
  sudo chown -R $curr_usr:$curr_grp /var/lib/plexmediaserver &> /dev/null
  sudo systemctl --system daemon-reload &> /dev/null
  sudo service plexmediaserver start &> /dev/null
fi

echo " "
echo " "
echo "Thanks for using this script, Credits: https://goo.gl/N4Tc2B"
echo " "
echo " "
