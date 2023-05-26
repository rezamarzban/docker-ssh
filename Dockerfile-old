# Ubuntu distribution version can be one of 16.04, 18.04, 20.04 and 22.04.
FROM ubuntu:18.04

# Install OpenSSH server
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# Change root login password
RUN echo 'root:password' | chpasswd

# Change root login permission in OpenSSH server config file
RUN sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Expose port 22 (default port for ssh)
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
