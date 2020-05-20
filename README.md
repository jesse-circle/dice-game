# Circle CI Demo

## Features
 1. Build go application.
 2. Headless browser test.
 3. Multiple Go Version builds with matrix jobs.
 4. Deploy to multi-cloud kubernetes
 5. Shift left security scanning
 6. Deploy variables in Context.
 7. Multiple resource classes.
 8. Explicit caching (Go modules).
 9. Makefile execution.
 10. Feature branches -> staging.
 11. Approval workflows.

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

# Kubernetes Endpoints

 * http://prod.google.knobs.io/
 * http://prod.aws.knobs.io/
