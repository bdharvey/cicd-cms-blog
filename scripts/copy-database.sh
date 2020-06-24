#!/bin/bash

# Arguments variables that are used in this file
# $1 : SOURCE_DBHOST : Is the host of the source posrgres server
# $2 : SOURCE_PGUSER : Is the user name for the source postgres instance
# $3 : SOURCE_PGPASSWORD : Is the postgres password on the source database
# $4 : SROUCE_PGDB: Is the name of the database on the source postgres server

# $5 : DESTINATION_PGHOST: Is the hostname of the destination postgres server
# $6 : DESTINATION_PGUSER : Is the user name for the source postgres instance
# $7 : DESTINATION_PGPASSWORD : Is the password on the destination postgres instance
# $8 : DESTINATION_PGDB: Is the name of the database on the desintation server

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "\$1 : SOURCE_DBHOST : Is the host of the source posrgres servera"
    echo "\$2 : SOURCE_PGUSER : Is the user name for the source postgres instance"
    echo "\$3 : SOURCE_PGPASSWORD : Is the postgres password on the source database"
    echo "\$4 : SROUCE_PGDB: Is the name of the database on the source postgres server"
    echo "\$5 : DESTINATION_PGHOST: Is the hostname of the destination postgres server"
    echo "\$6 : DESTINATION_PGUSER : Is the user name for the source postgres instance"
    echo "\$7 : DESTINATION_PGPASSWORD : Is the password on the destination postgres instance"
    echo "\$8 : DESTINATION_PGDB : Is the name of the database on the desintation server"

    exit 1;
fi

docker run --rm --network="host" -v /tmp/:/tmp/ -e PGPASSWORD=$3 postgres pg_dump -U $2 -h $1 $4 > /tmp/backup.sql
