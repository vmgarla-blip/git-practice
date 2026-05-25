#!/bin/bash
USERID=$(id -u)
#Check if user is root

USERID=$(id -u)
LOGS_DIR=/home/ec2-user/shell-logs
LOGS_FILE=$LOGS_DIR/$0.log
if [ $USERID -ne 0 ]; then
    echo "Please run the script as root user"
    exit 1
fi

# first arg - what software you are trying to isntall
# second arg - exit code
VALIDATE () {

    if [ $2 -ne 0  ]; then
        echo "$1 installation failed"
        exit 1
    else
        echo "$1 installed successfully"
    fi

}

for package in $@
do
    echo "Installing $package..."
    dnf list installed $package 
    if [ $? -ne 0 ] ; then
        dnf install $package -y >> $LOGS_FILE
        VALIDATE "Installing $package" $?
    else
        echo "$package already installed ... skipping"
    fi


done

