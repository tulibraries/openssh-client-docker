FROM harbor.k8s.temple.edu/library/alpine:3.14

USER root
RUN apk add -U --no-cache openssh-client=8.3_p1-r2 \
  && mkdir .ssh && chown nobody:nobody .ssh \
  && chmod 700 .ssh
USER nobody
