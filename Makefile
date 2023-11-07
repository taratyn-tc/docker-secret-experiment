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
show-secret: docker-run
	echo "The expected secret:"
	cat secret.txt