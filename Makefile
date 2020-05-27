all: build
	
build:
	mkdir -p 1.13
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s" -a -installsuffix cgo -o 1.13/dice-game .
	docker build . -t dice-game

run: 
	docker run -p 9000:9000 dice-game 