
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
build_angular