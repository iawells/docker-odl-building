# docker-odl-building
How to build ODL components without reading the wiki pages

Introduction
------------

This is a really simple set of docker files and scripts to create
build environments for ODL.  The base container ensures that all the build
elements are in place, and the customised containers provide
fetched, built environments for a range of projects (from which you
can then start the container, edit away and then rebuild to your
heart's content).  The nature of containers lets you make a clean
build from scratch without installing a ton of packages on your
main Linux system.`

Notes
-----
localmirror.sources.list, if in the top level directory, will be pulled 
into your containers and used as their Ubuntu sources.list file.  This
is useful if you have a local Ubuntu mirror you'd like to redirect to.
If not, just don't do anything and the default mirrors will be used.

Change the top level Makefile to change the maintainer name (your
email, if you change anything) and the tag prefix (used in your
Docker image tags).  Otherwise you get to use my defaults.

Dockerfiles are *not* saved to git and are .gitignored.  All 
Dockerfiles are made with shell scripts; it makes it a little easier
to write repetitive sections in them.

Working?
--------

The 'full' target I've not retested yet; the 'neutron' one (which
builds the Neutron NB alone) works fine.

Using the results
-----------------
docker run -t -i iawells/neutron
(for instance, given the default TAGPFX, to get into the 'neutron'
build environment this docker builds.  The environment contains
the build tree(s) in /build.)
