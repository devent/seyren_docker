REPOSITORY := erwinnttdata
NAME := seyren
VERSION ?= 1.5.0_001

build: _build ##@targets Builds the docker image.

rebuild: _rebuild ##@targets Builds the docker image anew.

clean: _clean ##@targets Removes the docker image.

deploy: _deploy ##@targets Deploys the docker image to the repository.

test-graphite:
	docker run -d -p "2003:2003" -p "2004:2004" -p "7002:7002" -p "8000:8000" --name graphite_carbon erwinnttdata/graphite_carbon

test-mongodb:
	docker run -d --name "mongodb" mongo:3.3.15

test-seyren:
	docker run -d -p "8080:8080" --link "mongodb:mongodb" --link "graphite_carbon:graphite"  -e "MONGO_URL=mongodb://mongodb:27017/seyren" -e "GRAPHITE_URL=http://graphite:8000" --name $(NAME) $(REPOSITORY)/$(NAME):$(VERSION)

include Makefile.help
include Makefile.functions
include Makefile.image

.PHONY +: build rebuild clean deploy
