#!/bin/bash
#### special vars ###
echo "All variables passed to script: $@"
echo "No of variables passed to script $#"
echo "First variable passed to script $1"
echo "script name is $0"
echo "who is running the script $USER"
echo "which directory we are in $(pwd)"
echo "home directory of user is $HOME"
echo "process id of script is $$"