FROM alpine:latest
WORKDIR /app/
COPY ./helloworld ./
ENTRYPOINT ["./helloworld"]