
#!/bin/bash
###############################################################################
#                                                                             #
# install_wetty.sh - Install Web TTY                                          #
#                                                                             #
# Copyright (C) 2017 Yayworks, Inc. - All Rights Reserved                     #
#                                                                             #
# Last revised 06/14/2017                                                     #
#                                                                             #
###############################################################################
        display_usage() {
                echo "Run this script as ssh_user from /home/ssh_user directory"
                echo "Install Web TTY"
                }
###############################################################################

echo "Installing Web TTY..."


wget https://s3.amazonaws.com/yb-lab-cfg/ibm-6.9.1.0-node-v6.9.1-linux-ppc64le.bin
chmod +x ibm-6.9.1.0-node-v6.9.1-linux-ppc64le.bin
/usr/bin/wget  https://s3.amazonaws.com/yb-lab-cfg/admin/yb-admin.NIMBIX.ppc64le.tar
##Untar user management executables into /usr/bin directory
sudo tar xvf yb-admin.NIMBIX.ppc64le.tar -C /usr/bin

echo Y |sudo apt-get install tcl
echo Y |sudo apt-get install git

##Remove tarballs
rm *.tar


echo "Installing nodejs SDK; install it in /usr/local/node; pick defaults for rest of questions"
sudo ./ibm-6.9.1.0-node-v6.9.1-linux-ppc64le.bin <<EOF
5

1
/usr/local/node
Y
1



EOF
rm ibm-6.9.1.0-node-v6.9.1-linux-ppc64le.bin
#
export PATH=/usr/local/node/bin:/usr/local/cuda/bin:$PATH
##Install wetty
mkdir -p /home/nimbix/wetty
cd /home/nimbix

git clone https://github.com/krishnasrinivas/wetty

cd wetty

/usr/local/node/bin/npm install

exit 0

