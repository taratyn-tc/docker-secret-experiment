# Using Secrets When Building Docker Containers

Frequently I need access to a secret when building a Docker container. Frequently, this is neccessary to download 
packages from private repositories or access other private resources.

‼️ Note: this repo contains `secret.txt` for demonstration purposes. Please do not commit actual secrets to your repo ‼️

‼️ Note: This repo *copies* the secret into the container... which is terrible! This is just for demonstration purposes. 
   Please do not persist your secrets in your container. That's the same as leaking your secret. ‼️

## Building the Container with `docker build`

1. Define the secret using `--secret id=mysecret,src=$(PWD)/secret.txt` argument to the `docker build` command.  
2. Use the secret in the Dockerfile using the `--mount=type=secret,id=mysecret` argument to the RUN command.

This is documented [the official docs](https://docs.docker.com/engine/reference/builder/#run---mounttypesecret)  

## Building the Container with `docker compose`

1. Define the secret in the `docker-compose.yml` file using the top level `secrets` stanza.
   - to mount a whole file use `file: ./secret.txt` as the body of the secret.
2. Reference the secret in your `docker-compose.yaml`'s `services.SERVICENAME.build.secrets` list.
3. Use the secret in the Dockerfile using the `--mount=type=secret,id=mysecret` argument to the RUN command.

This is documented in the compose spec's [secrets docs](https://github.com/compose-spec/compose-spec/blob/master/09-secrets.md) 
and [build docs](https://github.com/compose-spec/compose-spec/blob/master/build.md#secrets).
