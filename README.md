# Seyren in a Docker container

## TL;DR

```bash
# start graphite
docker run -d -p "2003:2003" -p "2004:2004" -p "7002:7002" -p "8000:8000" --name graphite_carbon erwinnttdata/graphite_carbon
# start mongodb
docker run -d --name "mongodb" mongo:3.3.15
# start seyren
docker run -d -p "8080:8080" --link "mongodb:mongodb" --link "graphite_carbon:graphite"  -e "MONGO_URL=mongodb://mongodb:27017/seyren" -e "GRAPHITE_URL=http://graphite:8000" --name seyren erwinnttdata/seyren
```

# Contributions

The idea for the image was taken from the [usman/docker-seyren](https://hub.docker.com/r/usman/docker-seyren/) docker image.

# License

*The MIT License (MIT)*

Copyright (c) 2016 Erwin Müller, erwin.mueller@nttdata.com
