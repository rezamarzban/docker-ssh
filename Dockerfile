# Pull ubuntu:latest

FROM ubuntu

# Install base packages

RUN yes | unminimize

# Update packages

RUN apt update && apt upgrade -y

# Install sudo and OpenSSH

RUN apt install sudo openssh-server -y
RUN mkdir /var/run/sshd

# Create new sudo user

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu

# Update user password

RUN echo 'ubuntu:admin' | chpasswd

# Expose port 22 (default port for ssh)

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
