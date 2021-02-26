DOCKER_CMD         ?= docker
FORMIO_RELEASE ?= latest
DOCKER_ORG ?= witcom
DOCKER_IMAGE ?= formio-server
DOCKER_REPO ?= somerepo

.prepare_formio-$(FORMIO_RELEASE).tmp:
	test -d tmp || mkdir tmp	
	./prepare_formio.sh
	touch .prepare_formio-$(FORMIO_RELEASE).tmp

docker_build: .prepare_formio-$(FORMIO_RELEASE).tmp
	$(DOCKER_CMD) build . -t $(DOCKER_ORG)/$(DOCKER_IMAGE):$(FORMIO_RELEASE)

docker_tag:
	$(DOCKER_CMD) tag $(DOCKER_ORG)/$(DOCKER_IMAGE):$(FORMIO_RELEASE) $(DOCKER_REPO)/$(DOCKER_ORG)/$(DOCKER_IMAGE):$(FORMIO_RELEASE)

clean:
	rm -rf .prepare_formio-$(FORMIO_RELEASE).tmp ./tmp app.tar.gz

