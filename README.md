# plex-server-ubuntu16-fix
Plexmedia server on Ubuntu 16.X was not able to read files from external disk's. Editing /etc/default/plexmediaserver also don't work, as systemd takes over and uses /etc/systemd/system/&lt;service_name>.service for configuration of the plexmediaserver daemon
