all:
	
build:
	mkdir -p 1.12
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s" -a -installsuffix cgo -o 1.12/circleci .
	docker build .

docker-login:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 241099261431.dkr.ecr.us-east-1.amazonaws.com

eks-auth:
	aws eks --region us-east-1 update-kubeconfig --name jlovelace-demo-k8s

gcs-auth:
	gcloud container clusters get-credentials demo-cluster

gcs-login:
	gcloud auth application-default login

gcs-docker:
	gcloud auth configure-docker

reset:
	git checkout master
	git pull origin master
	git checkout jll-my-great-feature
	git pull origin jll-my-great-feature
	git merge master
	git push origin jll-my-great-feature

create-traefik-ns:
	kubectl create ns traefik-system