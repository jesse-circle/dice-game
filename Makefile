build:
	mkdir -p 1.12
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s" -a -installsuffix cgo -o 1.12/circleci .
	docker build .