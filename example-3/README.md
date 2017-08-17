# README #

In th following examples, we will use `docker-compose` to define a 'stack' containing our services. 
While previously we were only capable of running a single instance of the docker containers running our app, 
using the 'service' abstraction provided by docker give us the capability of describing how to start one or 
more instances of the same container without having to worry about name or port conflicts. 

Disclaimer: When running docker-compose to run our 'stack', it will only run one instance of each service. 
However, when deploying the same 'stack' into a docker swarm, we will have the capability of replicating
the service into multiple instances.    

## Default stack ##

To default `docker-compose.yml` included in this example, works similarly to the previous example where we mounted 
the source code inside the container.

To run the 'stack', run: 
```bash
docker-compose up -d
```

To see the logs for  all the services:
```bash
docker-compose logs
``` 

Go to: `http://localhost:3000` to verify the app is able to read the DB.

* **Note:** There might be a delay before the DB is ready, so it's normal to see an error the first time you open the app URL. 
Keep reloading the page until you see the data obtained from the DB.


To tear down the docker resources by running, run:

```bash
docker-compose down -v
```

## Alternate stack using custom image ##
 We also have a `docker-compose-with-image.yml` with instruction to for creating a new image to contain our app code (see the `Dockerfile` to see how the image is defined).

To run the 'stack' with out app running inside our custom image, first build the image bu running: 
```bash
docker-compose -f docker-compose-with-image.yml build
``` 
Then run the 'stack' by running:
```bash
docker-compose -f docker-compose-with-image.yml up -d
```
Got to: `http://localhost:3000` to verify the app is able to read the DB.

Finally, tear down the docker resources by running:
```bash
docker-compose -f docker-compose-with-image.yml down -v
```



