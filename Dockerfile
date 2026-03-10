FROM ubuntu:22.04

WORKDIR /app

COPY test.txt .

CMD ["cat", "test.txt"]
