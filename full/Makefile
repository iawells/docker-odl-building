all:	odl-full

# This builds all projects on the 'getting started' wiki.

odl-full:	Dockerfile
	# This runs every time, but Docker's good at removing unneeded steps
	docker build -t $(TAGPFX)/odl-full .

Dockerfile: make-dockerfile ../shellfuncs
	env TAGPFX=$(TAGPFX) SOURCES_LIST=$(SOURCES_LIST) MAINTAINER=$(MAINTAINER) ./make-dockerfile > Dockerfile

clean:
	-rm Dockerfile
