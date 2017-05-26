
#!/bin/bash
###############################################################################
#                                                                             #
# install_XLCompilers.sh - Install Community Edition Compilers                #
#                                                                             #
# Copyright (C) 2017 Yayworks, Inc. - All Rights Reserved                     #
#                                                                             #
# Last revised 05/26/2017                                                     #
#                                                                             #
###############################################################################
        display_usage() {
                echo "Run this script as ssh_user from /home/ssh_user directory"
                echo "Install IBM XL Community Edition C/C++ & Fortran compilers"
                }
###############################################################################


##Install IBM XL Community Edition C/C++ & Fortran compilers

echo "Installing IBM XL Community Edition C/C++ & Fortran compilers"

wget -q http://public.dhe.ibm.com/software/server/POWER/Linux/xl-compiler/eval/ppc64le/ubuntu/public.gpg -O- | sudo apt-key add -
echo "deb http://public.dhe.ibm.com/software/server/POWER/Linux/xl-compiler/eval/ppc64le/ubuntu/ trusty main" | sudo tee /etc/apt/sources.list.d/ibm-xl-compiler-eval.list
sudo apt-get update

sudo apt-get install -y xlc.13.1.5

sudo /opt/ibm/xlC/13.1.5/bin/xlc_configure <<EOF
1
EOF

sudo apt-get install -y xlf.15.1.5

sudo /opt/ibm/xlf/15.1.5/bin/xlf_configure <<EOF
1
EOF


exit 0

