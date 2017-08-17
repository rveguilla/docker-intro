# README #

In th following examples, we will create a container to run our simple NodeJs app.
This requires creating a network to connect the app container and the db container.
In this example, we will use the office Node docker image and mount our code inside the container.


The following examples consists of running a NodeJS app that will connect to a MySQL db running on docker.

To create the shared network, run:
```bash
./create-network.sh
```
To create the DB, run:
```bash
./run-db.sh
``` 
To see the logs for the db container:
```bash
docker logs app_db
``` 
To run the app:
```bash
node index.js
```
To see the logs for the app container:
```bash
docker logs app
``` 

Go to: `http://localhost:3000` to verify the app is able to read the DB.

* **Note:** There might be a delay before the DB is ready, so it's normal to see an error the first time you open the app URL. 
Keep reloading the page until you see the data obtained from the DB.
 
To tear-down docker resources, run:
```bash
./clean-up.sh
```