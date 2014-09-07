#!/bin/bash

#Author: Bill Zhao

#Sometimes we may fail to install perl module from cpan, becaue of
#we have no administrator permission. This script is for fixing 
#this issue.

set -e
#finger `whoami` | sed -n -r -e '/Directory: (\S*).*/{s//\1/;p}'
cd $HOME/.cpan/build

for folder in *
do
    if [ -d $folder ]
    then
        echo -e "\033[1;40;31m Entering $folder and do \"sudo make install\"\033[0m"
        cd $folder; 
        sudo make install;
        cd ..
    fi
done
