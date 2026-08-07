FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ocaml make netcat-traditional && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
RUN make

EXPOSE 8080
ENTRYPOINT ["sh", "-c", "./marina \"$0\" && while true; do { printf 'HTTP/1.1 200 OK\\r\\n\\r\\nmarina is running\\r\\n' | nc -l -p 8080; } done"]
CMD ["(a&b | c)->d <-> ~e"]
