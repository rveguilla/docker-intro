# README #

In this example, we will use `docker-compose` to create a stack container two different versions of our app,
one using MySQL and the the other using Postgres, and an nginx reverse proxy to allow accessing both apps through the same port (see `nginx/default.conf` for more details). 
Since we are using nginx to route traffic to the container running our apps, we don't need to expose the individual app ports.

## Default stack ##

The default `docker-compose.yml` included in this example works similarly to the previous example where we mounted 
the source code inside the container.

To run the 'stack', run: 
```bash
docker-compose up -d
```
To see the logs for  all the services:
```bash
docker-compose logs
``` 
Verify that the app is running:

* To verify the MySQL app is able to read the DB, go to: `http://localhost/mysql`

* To verify the Postgres app is able to read the DB, go to: `http://localhost/postgres`

**Note:** There might be a delay before the DB is ready, so it's normal to see an error the first time you open the app URL. 
Keep reloading the page until you see the data obtained from the DB.

To tear down the docker resources by running, run:

```bash
docker-compose down -v
```

## Alternate stack using custom image ##
The project includes a `docker-compose-with-image.yml` which will create a new image to contain our app code (see the `Dockerfile` to see how the image is defined).

To run the 'stack' with out app running inside our custom image, first build the image bu running: 
```bash
docker-compose -f docker-compose-with-image.yml build
``` 
Then run the 'stack' by running:
```bash
docker-compose -f docker-compose-with-image.yml up -d
```
Verify that the app is running:

* To verify the MySQL app is able to read the DB, go to: `http://localhost/mysql`

* To verify the Postgres app is able to read the DB, go to: `http://localhost/postgres`

Finally, tear down the docker resources by running:
```bash
docker-compose -f docker-compose-with-image.yml down -v
```



