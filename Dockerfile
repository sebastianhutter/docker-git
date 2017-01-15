FROM alpine
MAINTAINER Sebastian Hutter <mail@sebastian-hutter.ch>

# add the git ssh config and private key
# do not forget to add the public key as deploy key to your github repos
ADD config /root/.ssh/config
ADD id_rsa /key

# install git etc
RUN apk --no-cache add git openssh-client tini && chmod 600 /key && mkdir /repository

# expose the repository volume
VOLUME /repository
# set the workdir
WORKDIR /repository

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["sh", "-c", "git clone git@github.com:${GIT_REPO}.git"]