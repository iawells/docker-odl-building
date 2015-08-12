all:	odl-neutron

odl-neutron:	Dockerfile
	# This runs every time, but Docker's good at removing unneeded steps
	docker build -t $(TAGPFX)/odl-neutron .

Dockerfile: make-dockerfile ../shellfuncs
	env TAGPFX=$(TAGPFX) SOURCES_LIST=$(SOURCES_LIST) MAINTAINER=$(MAINTAINER) ./make-dockerfile > Dockerfile

clean:
	-rm Dockerfile
