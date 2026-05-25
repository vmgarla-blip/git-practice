#!/bin/bash

set -e
USERID=$(id -u)
#Check if user is root

USERID=$(id -u)
LOGS_DIR=/home/ec2-user/shell-logs
LOGS_FILE=$LOGS_DIR/$0.log
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

trap 'echo "Error at line $LINENO", COMMAND : $BASH_COMMAND "' ERR

if [ $USERID -ne 0 ]; then
    echo "Please run the script as root user"
    exit 1
fi

# first arg - what software you are trying to isntall
# second arg - exit code


for package in $@
do
    echo "Installing $package..."
    dnf list installed $package 
    if [ $? -ne 0 ] ; then
        dnf install $package -y >> $LOGS_FILE
       s
    else
        echo -e "  $TIMESTAMP [INFO]  $package already installed ... $Y skipping $N" 
    fi


done

