<<<<<<< HEAD
## Agile Software Practice - Assignment 1.

In this assignment, the docker-compose.yml configuration file defines a multi-container application with four services: movies-api, database, redis and mongo-express. 

The backend: Used only for communication between internal services, such as movies-api, database and redis.
The frontend: Used for the connection between the database and mongo-express, so that mongo-express can access MongoDB.

Two volumes are defined in the file to persist the data:
profiledata: Mounts the MongoDB container to store the MongoDB database files.
redisdata: Mounted to a Redis container to persist data from Redis.

The services:
movies-api
container_name: Specify that the name of the container is movies-api.
image: Build the service using the doconnor/movies-api:1.0 image.
environment: Some environment variables are defined:
MONGODB_URI: The connection URI of the MongoDB database, containing the administrator username and password.
REDIS_URI: The connection URI of Redis.
ENABLE_WRITING_HANDLERS: Closes the handler for the write operation.
ports: Maps port 9000 of the host to port 9000 of the container for external access to the movies-api service.
Networks: Connect to the Backend network to make sure it can interoperate with Database and Redis.
depends_on: Make sure the database and redis containers start before the movies-api.

database
container_name: Specify that the name of the container is mongoDB.
image: Use the mongo:8.0-rc image.
environment: Defines the administrator username and password for MongoDB.
networks: Connect to the backend, frontend, and profile-network networks.
volumes: Define volume mounts and seeding files:
profiledata:/data/db: Mount the profiledata volume to the container's /data/db directory for persisting MongoDB data.
./seeding.json:/docker-entrypoint-initdb.d/seeding.json: mounts the local seeding.json file to the MongoDB container's initialization directory /docker-entrypoint-initdb.d to import the initial data when the container starts.

redis
container_name: Specify that the name of the container is Redis.
image: Image with redis:alpine.
networks: Connect to the backend network.
volumes: mounts the redisdata volume to the container's /data directory for data persistence in Redis.

mongo-express
container_name: Specify that the name of the container is express.
image: Image with mongo-express:1.0-20-alpine3.19.
restart: Configure automatic container restart.
ports: Maps port 8080 of the host to port 8081 of the container for external access to Mongo Express.
environment: Defines the configuration of Mongo Express, including the MongoDB administrator username and password, and the MongoDB service name.
networks: Connect to the frontend network so that it can access the database.
depends_on: Make sure the database container starts before starting mongo-express.
# Agile-Software-Practice---Assignment-1
>>>>>>> 27278b1b18f3beaf9ff104314b83d239762fb67b
