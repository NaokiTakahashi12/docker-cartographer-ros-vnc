DOCKERFILE		:= Dockerfile
PROJECT     	:= cartographer-ros-vnc
ORIGIN     		:= $(shell git remote get-url origin | sed -e 's/^.*@//g')
REVISION    	:= $(shell git rev-parse --short HEAD)
USERNAME		:= naokitakahashi12

KINETIC			:= kinetic
MELODIC			:= melodic

.PHONY: build
build: kinetic melodic

kinetic: $(KINETIC)/$(DOCKERFILE)
	@echo "build start $(USERNAME)/$(PROJECT):$(KINETIC) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(USERNAME)/$(PROJECT):$(KINETIC) \
	. >> /dev/null && \
	echo "build finished $(USERNAME)/$(PROJECT):$(KINETIC) <<< $<"

melodic: $(MELODIC)/$(DOCKERFILE)
	@echo "build start $(USERNAME)/$(PROJECT):$(MELODIC) <<< $<"
	@docker build \
		--file $< \
		--build-arg GIT_REVISION=$(REVISION) \
		--build-arg GIT_ORIGIN=$(REVISION) \
		--tag $(USERNAME)/$(PROJECT):$(MELODIC) \
	. >> /dev/null && \
	echo "build finished $(USERNAME)/$(PROJECT):$(MELODIC) <<< $<"

.PHONY: clean
clean: $(KINETIC) $(MELODIC)
	@for IMAGETAG in $^; do \
		echo "remove $(PROJECT):$$IMAGETAG"; \
		docker image rm $(USERNAME)/$(PROJECT):$$IMAGETAG; \
	done
	@echo "finished"

