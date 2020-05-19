build:
	mkdir -p 1.12
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s" -a -installsuffix cgo -o 1.12/circleci .
	docker build .
docker-login:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 241099261431.dkr.ecr.us-east-1.amazonaws.com
eks-auth:
	aws eks --region us-east-1 update-kubeconfig --name jlovelace-demo-k8s