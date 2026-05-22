#!/bash/bin
USERID=$(id -u)
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

dnf list installed mysql
if [ $? -eq 0 ]; then
    echo "My sql server is already installed"
    exit 0
else
    echo "Installing my sql server..."
    dnf install mysql -y

    VALIDATE "My sql server" $?

dnf list installed nginx
if [ $? -eq 0 ]; then
    echo "nginx is already installed"
    exit 0
else
    echo "Installing nginx..."
    dnf install nginx -y
    VALIDATE "nginx" $?
fi    