FROM ubuntu:14.04
MAINTAINER Peter Lauri <peterlauri@gmail.com>

# update ubuntu
RUN apt-get update && apt-get upgrade -y && apt-get install -y
# dependencies
# openssh-client:	ssh-keyscan etc.
# python-dev:		python compiling
# python-setup-tools: 	pip
# libpq-dev:		to be able to build/use psycopg2 python package
# git:			for pip git installs
# curl:			to download stuff for builds
RUN apt-get install -y openssh-client python-dev python-setuptools libpq-dev git curl

# setup pip and virtual env
RUN easy_install pip
RUN pip install --upgrade pip
RUN pip install virtualenv
RUN virtualenv /venv

# uwsgi setups
EXPOSE 80
ADD uwsgi.ini /uwsgi.ini
CMD ["/venv/bin/uwsgi", "--ini", "/uwsgi.ini"]
