## How to setup quickly?

### Setup a mongodb instance

```
docker run --name bbmongo -d -p 27011:27017 -v /your/data/path:/data/db mongo --auth
# -v is only available on Linux

# add initial users, you can follow the instruction here: https://docs.nodebb.org/installing/os/ubuntu/#configure-mongodb
docker exec -it bbmongo mongo admin

```

### Config nodebb server

Just fill the nodebb.env file with your information

### Build nodebb docker image

```
docker build -t mynodebb .
```


### Run nodebb container

```
docker run --name mybb -d -p 2333:2333 --link bbmongo --env-file ./nodebb.env mynodebb
```
