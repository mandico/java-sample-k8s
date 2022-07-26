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

function maven_setversion() {
    HEADLINE=$1
    print_headline "Maven Set Version"
    cd $SCRIPTPATH/../code/java-sample-k8s/
    ./mvnw versions:set -DnewVersion=2.0.0
    if [[ $? != 0 ]];
    then
        print_headline "Failed Maven Set Version"
        exit 1;
    fi;
    print_headline "Success Maven Set Version"
}

function maven_clean() {
    print_headline "Maven Clean Project"
    cd $SCRIPTPATH/../code/java-sample-k8s/
    ./mvnw clean
    if [[ $? != 0 ]];
    then
        print_headline "Failed Maven Clean Project"
        exit 1;
    fi;
    print_headline "Success Maven Clean Project"
}

function maven_install() {
    print_headline "Maven Build Project"
    cd $SCRIPTPATH/../code/java-sample-k8s/
    ./mvnw install
    if [[ $? != 0 ]];
    then
        print_headline "Failed Maven Build Project"
        exit 1;
    fi;
    print_headline "Success Maven Build Project"
}

function build_angular() {
    print_headline "Build Angular"
    cd $SCRIPTPATH/../code/webapp/

    npm --version
    npm install --no-optional --no-audit --verbose
    if [[ $? != 0 ]];
    then
        print_headline "Failed NPM Install"
        exit 1;
    fi;

    node_modules/.bin/ng build --aot --output-path "../java-sample-k8s/src/main/resources/public" --base-href ./
    if [[ $? != 0 ]];
    then
        print_headline "Failed Build Angular"
        exit 2;
    fi;
}

# Absolute path to this script
SCRIPT=$(readlink -f "$0")
print_headline "Information"
echo " Script...................:" $SCRIPT
# Absolute path this script
SCRIPTPATH=$(dirname "$SCRIPT")
echo " Absolute Path............:" $SCRIPTPATH

maven_setversion '2.0.0'
maven_clean
maven_install