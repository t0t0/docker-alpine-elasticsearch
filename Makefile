VERSION ?= 2.3.2


build:
	docker build --no-cache --force-rm -t t0t0/docker-alpine-elasticsearch:$(VERSION) $(VERSION)

clean:
	docker rmi t0t0/docker-alpine-elasticsearch:$(VERSION)

rebuild: clean build

cleanup:
	docker images -q --filter "dangling=true" | xargs -r docker rmi