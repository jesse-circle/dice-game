# Circle CI Demo

## Features
 1. Build go application.
 2. Headless browser test.
 3. Multiple Go Version build check.
 4. Deploy to AppEngine.

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
