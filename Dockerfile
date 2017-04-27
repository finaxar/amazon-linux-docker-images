FROM scratch
ADD amzn-container-minimal-2016.09.1.20161221-x86_64.tar.xz /
# install build tools 
RUN yum install make automake gcc gcc-c++ kernel-devel git-core -y 

RUN yum update -y
RUN yum install -y python27
RUN curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | /usr/bin/python27
RUN easy_install pip
RUN echo "alias python='python27'" >> ~/.bashrc
RUN source ~/.bashrc
