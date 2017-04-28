FROM scratch
ADD amzn-container-minimal-2016.09.1.20161221-x86_64.tar.xz /
# install build tools 
RUN yum install -y zip wget make automake gcc gcc-c++ kernel-devel git-core libffi-devel openssl-devel

RUN yum update -y
RUN yum install -y python27 python27-devel

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN /usr/bin/python27 get-pip.py
RUN echo "alias python='python27'" >> ~/.bashrc
RUN source ~/.bashrc
