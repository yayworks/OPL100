#!/bin/bash
###############################################################################
#                                                                             #
# yb-config.NIMBIX.ppc64le.p8AI.sh - Configuraton of the PowerAI GPU Lab      #
#                                                                             #
# Copyright (C) 2017 Yayworks, Inc. - All Rights Reserved                     #
#                                                                             #
# Last revised 05/25/2017                                                     #
#                                                                             #
###############################################################################
        display_usage() {
                echo "Run this script as ssh_user from /home/ssh_user directory"
                echo "Install nodejs SDK in /usr/local/node"
                }
###############################################################################

echo "Pre configuring this system as a Basic Yaybench POWER8/GPU Lab..."


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
echo "modify $PATH in .bashrc; add the following line to .bashrc before sourcing it"

echo 'export PATH=/usr/local/node/bin:/usr/local/cuda/bin:/opt/ibm/xlC/13.1.5/bin:/opt/ibm/xlf/15.1.5/bin:$PATH' >> .bashrc
echo 'export PATH=/usr/local/node/bin:/usr/local/cuda/bin:/opt/ibm/xlC/13.1.5/bin:/opt/ibm/xlf/15.1.5/bin:$PATH' >> /etc/bash.bashrc
export PATH=/usr/local/node/bin:/usr/local/cuda/bin:/opt/ibm/xlC/13.1.5/bin:/opt/ibm/xlf/15.1.5/bin:$PATH

username="user"
password="user"
                pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
                sudo useradd -m -p $pass $username

#echo "Configuring this system as a Basic Yaybench POWER8/GPU Lab..."

##Set up login-based access to the system
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

sudo service ssh restart

##Install wetty
cd /home/nimbix
mkdir wetty

git clone https://github.com/krishnasrinivas/wetty

cd wetty

/usr/local/node/bin/npm install

##Programmatically create self-signed certificates
/usr/bin/yb-gencert yay

##Start wetty
#sudo /usr/local/node/bin/node app.js --sslkey yay.key --sslcert yay.pem -p 3000 &


exit 0


