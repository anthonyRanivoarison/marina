FROM debian:bookworm-slim AS builder
RUN apt-get update && apt-get install -y ocaml make && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .
RUN make

FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /app/marina .
ENTRYPOINT ["./marina"]
