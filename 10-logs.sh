#!/bin/bash
USERID=$(id -u)
LOGS_DIR=/home/ec2-user/shell-logs
LOGS_FILE=$LOGS_DIR/$0.log
#Check if user is root
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

dnf list installed mysql &>> $LOGS_FILE
if [ $? -eq 0 ]; then
    echo "My sql server is already installed"
else
    echo "Installing my sql server..."
    dnf install mysql -y &>> $LOGS_FILE

    VALIDATE "My sql server" $?
 fi   

dnf list installed nginx &>> $LOGS_FILE
if [ $? -eq 0 ]; then
    echo "nginx is already installed"
else
    echo "Installing nginx..."
    dnf install nginx -y &>> $LOGS_FILE
    VALIDATE "nginx" $?
fi    