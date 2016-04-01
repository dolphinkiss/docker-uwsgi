FROM ubuntu:14.04
MAINTAINER Peter Lauri <peterlauri@gmail.com>

# update ubuntu
RUN apt-get update && apt-get upgrade -y && apt-get install -y

