FROM debian:latest

RUN mkdir /app
RUN --mount=type=secret,id=mysecert cat /run/secrets/mysecert > /app/secret
