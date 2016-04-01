FROM ubuntu:14.04
MAINTAINER Peter Lauri <peterlauri@gmail.com>

# update ubuntu
RUN apt-get update && apt-get upgrade -y && apt-get install -y
RUN apt-get install -y openssh-client

# setup pip and virtual env
RUN apt-get install -y python-dev python-setuptools
RUN easy_install pip
RUN pip install --upgrade pip
RUN pip install virtualenv
RUN virtualenv /venv

# postgresql dependency for 
RUN apt-get install -y libpq-dev

# we need to be able to fetch packages from github repos
RUN apt-get install -y git

# uwsgi setups
EXPOSE 80
ADD uwsgi.ini /uwsgi.ini
CMD ["/venv/bin/uwsgi", "--ini", "/uwsgi.ini"]
