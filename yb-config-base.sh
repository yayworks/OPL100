#!/bin/bash
###############################################################################
#                                                                             #
# yb-config-base.sh -  Run script after instance start                        #
#                                                                             #
# Copyright (C) 2017 Yayworks, Inc. - All Rights Reserved                     #
#                                                                             #
# Last revised 5/19/2017                                                      #
#                                                                             #
###############################################################################
        display_usage() { 
        	echo "This script must be run with sudo privileges." 
        	echo -e "\nUsage:\n$0 lab_provider lab_arch lab_tag base_dir cur_user pubDNS session_dur \n" 
        	} 
# if less than one argument supplied, display usage 
	if [  $# -le 6 ] 
	then 
		display_usage > yb-OUT-ERR 2>&1
		exit 1
	fi 
##
##  Run this script from ssh_user home directory
##  sudo /usr/local/yb-config_base.sh $lab_arch $lab_tag
##
##
 
###############################################################################
# actual script starts here

lab_provider=$1
lab_arch=$2
lab_tag=$3
base_dir=$4
cur_user=$5
pubDNS=$6
session_dur=$7

install_script="yb-config."${lab_provider}"."${lab_arch}"."${lab_tag}".sh"

echo "Install script is " $install_script >> yb-OUT-ERR 2>&1

##https://s3.amazonaws.com/yb-lab-cfg/config/yb-config.NIMBIX.ppc64le.std.sh

script_url="https://s3.amazonaws.com/yb-lab-cfg/config/"${install_script}

echo "Install script URL is " $script_url >> yb-OUT-ERR 2>&1

curl -O $script_url >> yb-OUT-ERR 2>&1 || echo "curl transfer FAILED!" >> yb-OUT-ERR 2>&1

chmod +x $install_script

file_path=${PWD}"/"${install_script}

echo $file_path >> yb-OUT-ERR 2>&1

$file_path $base_dir $cur_user $pubDNS $lab_tag $session_dur  >> yb-OUT-ERR 2>&1

exit 0
