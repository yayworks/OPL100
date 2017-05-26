
#!/bin/bash
###############################################################################
#                                                                             #
# install_jhub.sh - Install Jupyterhub                                        #
#                                                                             #
# Copyright (C) 2017 Yayworks, Inc. - All Rights Reserved                     #
#                                                                             #
# Last revised 05/26/2017                                                     #
#                                                                             #
###############################################################################
        display_usage() {
                echo "Run this script as ssh_user from /home/ssh_user directory"
                echo "Install Jupyterhub"
                }
###############################################################################

echo "Installing Jupyterhub..."

sudo apt-get update
sudo apt-get install -y python3-pip
sudo apt-get install -y npm nodejs-legacy
sudo npm install -g configurable-http-proxy
sudo pip3 install jupyterhub
sudo pip3 install --upgrade notebook


exit 0
