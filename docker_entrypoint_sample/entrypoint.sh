#!/bin/bash

. /tashome/tasrtenv.sh
if [ ! -f "/tas-initialized" ]; then #check whether the TAS is initialized.
    echo 'Initializing tas'
    while ! mysqladmin ping -hmysql --silent; do
        sleep 1
    done
    yes "yes" | tasdbinit.sh;
    /skyprod/abs/prod/oam/sql/abs-initdb.sh;
    /skyprod/acc/prod/oam/sql/acc-initdb.sh;
    /skyprod/eml/prod/oam/sql/eml-initdb.sh;
    touch "/tas-initialized";
    echo 'TAS initialized';
fi

# run TAS
tasstart.sh -l

# prevent process exit.
while true; 
    do sleep 1000; 
done