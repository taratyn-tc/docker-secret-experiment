FROM debian:latest

RUN mkdir /app
RUN --mount=type=secret,id=mysecret cat /run/secrets/mysecret > /app/secret
