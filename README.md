# Seyren Docker Container

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

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
