.PHONY=docker-build
docker-build:
	docker build \
		--secret id=mysecret,src=$(PWD)/secret.txt \
		--progress=plain \
		--no-cache \
		--tag secret-mount-experiment \
		.

.PHONY=docker-run
docker-run: docker-build
	echo "Cat'ing container's secret:"
	docker run -it --rm secret-mount-experiment cat /app/secret
	
.PHONY=show-secret
show-secret-docker: docker-run
	echo "The expected secret:"
	cat secret.txt

.PHONY=docker-compose-build
docker-compose-build:
	docker compose --progress=plain build --no-cache

.PHONY=docker-compose-run
docker-compose-run: docker-compose-build
	docker compose up

.PHONY=show-secret-docker-compose
show-secret-docker-compose: docker-compose-run
	echo "The expected secret:"
	cat secret.txt
