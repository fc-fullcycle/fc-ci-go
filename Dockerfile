FROM golang:1.19 AS local
LABEL authors="fcoromoto"

WORKDIR /app

COPY src .

RUN go build -o math

CMD ["./math"]
