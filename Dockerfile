FROM golang:1.19
LABEL authors="fcoromoto"

WORKDIR /app

COPY . .

RUN go build -o math

CMD ["./math"]
