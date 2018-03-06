VERSION="latest"

all: image

check:
	(docker --version 2>&1 >/dev/null) || exit "Docker must be installed, and accessible via PATH"

image: check
	docker build $(PWD) -f Dockerfile -t brandocorp/concourse-chefdk-toolchain:$(VERSION)

publish: image
	docker push brandocorp/concourse-chefdk-toolchain:$(VERSION)
