openssh-client
===

openssh-client Dockerfile.


## Use
### Dependencies
* For scanning run `brew install trivy`
* For linting docker files `brew install hadolint`

### Trouble Shooting Failures.
* Usually if this fails it's because the version of package needs to be updated (try that first).


### Local
```
make build
```

* To run security scan `make scan`
* To lint the Dockerfile `make lint`
