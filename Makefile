build:
	mkdir -p 1.13
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s" -a -installsuffix cgo -o 1.13/circleci .
	docker build .