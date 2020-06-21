#!/bin/bash

# Arguments variables that are used in this file
# $1 : PGHOST: Is the hostname of the database that we are connecting to
# $2 : PGUSER : Is the usrename for the postgres instance
# $3 : PGPASSWORD : Is the password for the postgres instance that we are connecting to
# $4 : PGDB: Is the name of the postgres database that we are checking for

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "1 = PGHOST, 2 = PGUSER, 3 = PGPASSWORD, 4 = PGDB"
    exit 1;
fi

 # Here we are using a docker container go get access to the psql command. This is an attempt to make our scripts more portable
 # and not have to depend on the host system having the psql cli installed
 docker run --rm --network="host" -e PGPASSWORD=$3 postgres psql -U $2 -h $1 -tc "SELECT 1 FROM pg_database WHERE datname = '$4'" | grep -q 1 || docker run --rm --network="host" -e PGPASSWORD=$3 postgres psql -U $2 -h $1 -c "CREATE DATABASE $4"

