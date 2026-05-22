#!/bash/bin
USERID=$(id -u)
#Check if user is root
if [ $USERID -ne 0 ]; then
    echo "Please run the script as root user"
    exit 1
fi

dnf list installed mysql
if [ $? -eq 0 ]; then
    echo "My sql server is already installed"
    exit 0
else
    echo "Installing my sql server..."
    dnf install mysql -y


  if [ $? -ne 0 ]; then
    echo "My sql server installation failed"
    exit 1
  else
    echo "My sql server installed successfully"
  fi
fi 