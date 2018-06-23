FROM golang:alpine as builder
RUN apk update && apk add git && apk add ca-certificates
RUN adduser -D -g '' appuser
COPY app.go $GOPATH/src/micnubinub/app/
WORKDIR $GOPATH/src/micnubinub/app/
RUN go get -d -v
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix nocgo -o /app .
RUN chmod +x /app

FROM scratch
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /app /app/app
USER appuser

EXPOSE 12345
ENTRYPOINT ["/app/app"]

