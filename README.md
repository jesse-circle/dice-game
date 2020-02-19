# Circle CI Challenge

This project is a simple web app that is built, tested, and deployed with Circle CI.

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