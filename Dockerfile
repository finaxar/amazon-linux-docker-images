FROM scratch
ADD amzn-container-minimal-2016.09.1.20161221-x86_64.tar.xz /
# install build tools 
RUN yum install make automake gcc gcc-c++ kernel-devel git-core -y 

RUN yum update -y
RUN yum install -y python27
RUN curl -O https://bootstrap.pypa.io/get-pip.py | /usr/bin/python27
RUN echo "alias python='python27'" >> ~/.bashrc
RUN source ~/.bashrc
