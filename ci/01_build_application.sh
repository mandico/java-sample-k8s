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

function maven_clean() {
    print_headline "Maven Clean Project"
    cd $SCRIPTPATH/../code/java-sample-k8s/
    ./mvnw clean
}

function maven_install() {
    print_headline "Maven Build Project"
    cd $SCRIPTPATH/../code/java-sample-k8s/
    ./mvnw install
}

# Absolute path to this script
SCRIPT=$(readlink -f "$0")
print_headline "Information"
echo " Script...................:" $SCRIPT
# Absolute path this script
SCRIPTPATH=$(dirname "$SCRIPT")
echo " Absolute Path............:" $SCRIPTPATH
maven_clean
maven_install


mvn versions:set -DnewVersion=1.0.1
mvn clean package