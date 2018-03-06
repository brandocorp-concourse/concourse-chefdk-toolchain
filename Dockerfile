FROM ubuntu:16.04

ARG CHEFDK_VERSION="latest"

RUN apt-get update -y -q \
  && apt-get install -y curl jq \
  && curl -L https://omnitruck.chef.io/install.sh \
      | bash -s -- -P chefdk -v ${CHEFDK_VERSION} \
  && /usr/bin/chef shell-init bash > /etc/profile.d/chefdk.sh \
  && chmod 755 /etc/profile.d/chefdk.sh \
  && touch /root/config.rb

ENTRYPOINT ["bash", "-l", "-c"]

WORKDIR /root
