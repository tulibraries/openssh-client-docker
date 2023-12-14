FROM harbor.k8s.temple.edu/library/alpine:3.19

USER root
RUN apk add -U --no-cache openssh-client-default=9.5_p1-r0  \
  && mkdir /root/.ssh && chmod 700 /root/.ssh
USER nobody
