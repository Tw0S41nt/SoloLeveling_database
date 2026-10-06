# Database Docker Container

## Starting the Database Container

1. Make sure you have Docker desktop installed for your platform: [https://www.docker.com/](https://www.docker.com/). Use the default options when prompted during installation.
2. Open a terminal
3. `cd` into the directory with `docker-compose.yml`
4. Run `docker compose up`
  - `up` will start a container per your instructions in the docker compose file including initializing the DB with your script
  - You may Ctrl+C out of this - it will stop the container
  - `docker compose start` will start the container running again
5. `docker compose down` will end AND remove the container process.  You don't want to run this unless you are ready to blow away your DB and all its data.

## Troubleshooting

If `docker` does not recognize `compose` or if `docker-compose` is not found, you may need to install the `docker-compose` tool.
```
sudo apt install docker-compose
```
Then:
# as required
```
docker-compose up
docker-compose down
```

## Using DBeaver to Interact with Database

1. Install [DBeaver Community Edition](https://dbeaver.io/download/)

# DBeaver Usage Instructions

1. Open DBeaver

2. Right click in the left hand Database Navigator, then Create Connection  

3. Click MariaDB, then Next 

4. The only thing you’ll need to change here is username, port and password.

    SoloFit database info:

    Username: user  
    Password: password
    port: 999

5. Then click finish 
