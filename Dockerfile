FROM golang:1.22

WORKDIR /usr/src/app 

COPY . .

RUN go mod tidy 

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app1

CMD ["/my_app1"] 