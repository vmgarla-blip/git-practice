#!/bash/bin
USERID=$(id -u)
#Check if user is root
if [ $USERID -ne 0 ]; then
    echo "Please run the script as root user"
    exit 1
fi

echo "Installing my sql server..."