#!/bin/bash

function print_headline() {
    HEADLINE=$1
    
    echo ""
    echo "-------------------------------------------------------------------------------------------"
    echo $HEADLINE
    echo "-------------------------------------------------------------------------------------------"
}

function print_line() {
    echo "-------------------------------------------------------------------------------------------"
}

function build_image() {
    print_headline "Build Image"
    cd $SCRIPTPATH/../
    docker build . -t luizmandico/java-sample-k8s:latest
 
    if [[ $? != 0 ]];
    then
        print_headline "Failed Build Image"
        exit 1;
    fi;
    print_headline "Success Build Image"
}


# Absolute path to this script
SCRIPT=$(readlink -f "$0")
print_headline "Information"
echo " Script...................:" $SCRIPT
# Absolute path this script
SCRIPTPATH=$(dirname "$SCRIPT")
echo " Absolute Path............:" $SCRIPTPATH
build_image
