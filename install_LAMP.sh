
#!/bin/bash
###############################################################################
#                                                                             #
# install_LAMP.sh - Install LAMP stack                                        #
#                                                                             #
# Copyright (C) 2017 Yayworks, Inc. - All Rights Reserved                     #
#                                                                             #
# Last revised 05/26/2017                                                     #
#                                                                             #
###############################################################################
        display_usage() {
                echo "Run this script as ssh_user from /home/ssh_user directory"
                echo "Install LAMP stack"
                }
###############################################################################

echo "Installing LAMP stack..."

echo "Install Apache2, Apache2 mods, PHP stack etc. as pre-reqs for NextCloud"

sudo apt-get update
sudo apt-get install -y apache2 mariadb-server libapache2-mod-php7.0

sudo apt-get install -y php7.0-gd php7.0-json php7.0-mysql php7.0-curl php7.0-mbstring

sudo apt-get install -y php7.0-intl php7.0-mcrypt php-imagick php7.0-xml php7.0-zip

sudo a2enmod rewrite headers env dir mime setenvif ssl

exit 0

