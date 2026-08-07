FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends ocaml make && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
RUN make

ENTRYPOINT ["./marina"]
CMD ["(a&b | c)->d <-> ~e"]
