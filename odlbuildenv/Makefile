all:	do-mvn settings.xml apache-maven-3.3.3-bin.tar.gz Dockerfile $(if $(SOURCES_LIST),local.sources.list)
	# This runs every time, but Docker's good at removing unneeded steps
	docker build -t $(TAGPFX)/odlbuildenv .

apache-maven-3.3.3-bin.tar.gz:
	-rm apache-maven-3.3.3.tar.gz
	wget http://apache.arvixe.com/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz

ifneq "$(SOURCES_LIST)" ""
local.sources.list:	$(SOURCES_LIST)
	cp $(SOURCES_LIST) local.sources.list
endif

Dockerfile: make-dockerfile ../shellfuncs
	env TAGPFX=$(TAGPFX) $(if $(SOURCES_LIST),SOURCES_LIST=local.sources.list) MAINTAINER=$(MAINTAINER) ./make-dockerfile > Dockerfile

clean:
	-rm apache-maven-3.3.3-bin.tar.gz Dockerfile local.sources.list
