PORT=8080

gosu:
	curl -o gosu -sSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-armhf"

build:
	docker build -t "dbunit/rpi-postgres" --rm=true .

debug:
	docker run -i -t --rm --link postgres --entrypoint=sh "dbunit/rpi-postgres"

run:
	docker run -d --name postgres -p $(PORT):5432 "dbunit/rpi-postgres"

stop:
	docker stop postgres

clean:
	docker rm -v postgres
