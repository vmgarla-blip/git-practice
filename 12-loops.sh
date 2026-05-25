#!/bin/bash
USERID=$(id -u)
#Check if user is root

USERID=$(id -u)
LOGS_DIR=/home/ec2-user/shell-logs
LOGS_FILE=$LOGS_DIR/$0.log
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
if [ $USERID -ne 0 ]; then
    echo "Please run the script as root user"
    exit 1
fi

# first arg - what software you are trying to isntall
# second arg - exit code
VALIDATE () {

    if [ $2 -ne 0  ]; then
        echo "$TIMESTAMP [ERROR]  Installing $1 failed" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$1 installed successfully" | tee -a $LOGS_FILE
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

