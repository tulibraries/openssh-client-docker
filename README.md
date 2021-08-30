openssh-client
===

openssh-client Dockerfile.


## Use
### Dependencies
* For scanning run `brew install trivy`
* For linting docker files `brew install hadolint`


### Local
```
make build
```

* To run security scan `make scan`
* To lint the Dockerfile `make lint`
