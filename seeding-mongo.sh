#!/bin/bash
mongoimport --host database --db tmdb_movies --collection movies --type json --file /docker-entrypoint-initdb.d/seeding.json --jsonArray
