FROM ubuntu:yakkety

RUN apt-get update
RUN apt-get install aptitude openssh-server sudo -y

RUN mkdir /var/run/sshd
RUN chmod 700 /var/run/sshd
RUN apt-get install openssh-server -y
RUN echo "me    ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

RUN adduser --disabled-password --gecos "" me

USER me
WORKDIR /home/me
RUN mkdir .ssh
RUN chmod 700 .ssh
COPY ./ubuntu_ssh_docker_rsa.pub .ssh/authorized_keys
COPY ./ubuntu_ssh_docker_rsa .

USER root
ENTRYPOINT ["/usr/sbin/sshd", "-D", "-p"]


RUN apt-get install python-setuptools python-pip virtualenv python3 python3-setuptools python3-pip -y
