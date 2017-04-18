# [FIX] Plexmediaserver not detecting files
Plexmedia server on Ubuntu 16.X was not able to read files from external disk's. Editing /etc/default/plexmediaserver also don't work, as systemd takes over and uses /etc/systemd/system/&lt;service_name>.service for configuration of the plexmediaserver daemon.

# How to use
  1. Clone/Download this repo

  ```
  sudo apt-get update && sudo apt-get install git -y
  ```
  ```
  git clone https://github.com/abhisekpadhi/plex-server-ubuntu16-fix
  ```

  2. Execute it

  ```
  cd plex-server-ubuntu16-fix && sh fix.sh
  ```
 If the script needs privileges, it will ask for your password

# What the script does
  - Prepares a file called plexmediaserver.service from content.txt
  - Moves the file to /etc/systemd/system/
  - Reloads the systemd system daemon
  - Restarts plexmediaserver
