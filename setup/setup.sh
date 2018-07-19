#!/bin/bash

RESULT=1

setup () {
    echo Setting up replica set
    mongo mongodb://mongo-rs0-1:27017 replicaSet.js
    RESULT=$?
}

echo Begin Setup

if [ ! -f /data/configdb/done ]; then
    setup
    while [ $RESULT -ne 0 ]; do
        echo An error ocurred, trying again
        setup
    done
    echo Success!
    touch /data/configdb/done
fi

echo End Setup