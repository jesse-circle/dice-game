# Circle CI Challenge

This project is a simple web app that is built, tested, and deployed with Circle CI.

[![CircleCI](https://circleci.com/gh/mentat/circle-ci-fun.svg?style=svg&circle-token=b502798af72ccbea153e1f86765b5072a055b4d3)](https://circleci.com/gh/mentat/circle-ci-fun)

# Building

```
go build
```

# Running Tests

```
go test
```

# Running Locally (port 9000)

```
go build
./circleci
```

# Deploying to AppEngine

Deploying requires a valid Google Cloud account to deploy to.

```
gcloud auth login
gcloud app deploy --project=<your project here> --promote app.yaml
```