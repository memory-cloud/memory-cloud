#!/bin/bash

RESULT=1

setup () {
    echo Setting up replica set
    mongo mongodb://mongo-rs0-1:27017 replicaSet.js
    RESULT=$?
}

sleep 7 | echo Sleeping
echo Begin Setup
setup
while [ $RESULT -ne 0 ]; do
    echo An error ocurred, trying again
    setup
done
echo Success!

echo End Setup