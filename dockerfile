FROM ubuntu:latest

# Update the system
RUN apt-get update && apt-get upgrade -y
 
# Install Server Tools
RUN apt-get install -y openssh-server sudo net-tools iproute2 netplan.io
 
# Set up configuration for SSH
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
 
# SSH login fix. Otherwise, user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
 
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Create Ubuntu user

RUN useradd ubuntu -m -p shi3c4p.9tFd2 -s /usr/bin/bash && usermod -aG sudo ubuntu 

# Expose the SSH port
EXPOSE 22
 
# Run SSH
CMD ["/usr/sbin/sshd", "-D"]
