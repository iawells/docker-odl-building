# This makefile is embarrassing in its dependency issues.  All the targets
# are virtual.

TAGPFX=iawells
# If localmirror.sources.list lists sources from a local mirror, they're used in
# place of defaults (which may improve your build speed).
# Will be empty if the file is not present, which means we'll go with the default.
SOURCES_LIST=$(abspath localmirror.sources.list)
MAINTAINER=iawells@cisco.com


# The default is a clean environment suitable for building, but without
# any built elements.
odlbuildenv.container:
	cd odlbuildenv; make TAGPFX="$(TAGPFX)" SOURCES_LIST="$(SOURCES_LIST)" MAINTAINER="$(MAINTAINER)" all

full.container: odlbuildenv.container
	cd full ; make TAGPFX="$(TAGPFX)" SOURCES_LIST="$(SOURCES_LIST)" MAINTAINER="$(MAINTAINER)" all

neutron.container: odlbuildenv.container
	cd neutron; make TAGPFX="$(TAGPFX)" SOURCES_LIST="$(SOURCES_LIST)" MAINTAINER="$(MAINTAINER)" all

clean:
	cd odlbuildenv; make clean
	cd full; make clean
	cd neutron; make clean
