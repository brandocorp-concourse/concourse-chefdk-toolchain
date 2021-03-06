FROM ubuntu:16.04

ARG CHEFDK_VERSION="latest"
ARG GIT_USER_EMAIL="noreply@github.com"
ARG GIT_USER_NAME="Concourse CI"

RUN apt-get update -y -q \
  && apt-get install -y curl jq git\
  && curl -L https://omnitruck.chef.io/install.sh \
      | bash -s -- -P chefdk -v ${CHEFDK_VERSION} \
  && /usr/bin/chef shell-init bash > /etc/profile.d/chefdk.sh \
  && chmod 755 /etc/profile.d/chefdk.sh \
  && touch /root/config.rb \
  && chef gem install github_changelog_generator \
  && git config --global user.email "${GIT_USER_EMAIL}" \
  && git config --global user.name "${GIT_USER_NAME}"


ENTRYPOINT ["bash", "-l", "-c"]

WORKDIR /root
