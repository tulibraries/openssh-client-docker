FROM harbor.k8s.temple.edu/library/alpine:3.14

USER root
RUN apk add -U --no-cache openssh-client-default=8.6_p1-r2 \
  && mkdir .ssh && chown nobody:nobody .ssh \
  && chmod 700 .ssh
USER nobody
