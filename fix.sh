#!/bin/bash
# Credits: https://goo.gl/N4Tc2B

###### CONSTANTS ######
target_file=`echo "/etc/systemd/system/plexmediaserver.service"`
curr_usr=`echo $USER`
curr_grp=$curr_usr
#######################

fs=`du -k $target_file | cut -f1`

# function step2 {
#   sudo chown -R $curr_usr:$curr_grp /var/lib/plexmediaserver &> /dev/null
#   sudo systemctl --system daemon-reload &> /dev/null
#   sudo service plexmediaserver start &> /dev/null
#   sudo service plexmediaserver restart &> /dev/null
# }

if [ ! -f $target_file ]
  then
    sudo touch $target_file
    sudo cp plexmediaserver.service.txt $target_file &> /dev/null
    sudo chown -R $curr_usr:$curr_grp /var/lib/plexmediaserver &> /dev/null
    sudo systemctl --system daemon-reload &> /dev/null
    sudo service plexmediaserver start &> /dev/null
    sudo service plexmediaserver restart &> /dev/null
elif [ $fs -eq 0 ]
   then
    sudo cp plexmediaserver.service.txt $target_file &> /dev/null
    sudo chown -R $curr_usr:$curr_grp /var/lib/plexmediaserver &> /dev/null
    sudo systemctl --system daemon-reload &> /dev/null
    sudo service plexmediaserver start &> /dev/null
    sudo service plexmediaserver restart &> /dev/null
else
  sudo cp plexmediaserver.service.txt $target_file &> /dev/null
  sudo chown -R $curr_usr:$curr_grp /var/lib/plexmediaserver &> /dev/null
  sudo systemctl --system daemon-reload &> /dev/null
  sudo service plexmediaserver start &> /dev/null
  sudo service plexmediaserver restart &> /dev/null
fi

echo " "
echo " "
echo "Thanks for using this script, Credits: https://goo.gl/N4Tc2B"
echo " "
echo " "
