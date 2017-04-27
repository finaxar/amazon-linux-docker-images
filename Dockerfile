FROM scratch
ADD amzn-container-minimal-2016.09.1.20161221-x86_64.tar.xz /
# install build tools 
RUN yum install make automake gcc gcc-c++ kernel-devel git-core -y 

# install python 2.7 and change default python symlink 
RUN yum install python27-devel -y 
RUN rm /usr/bin/python
RUN ln -s /usr/bin/python2.7 /usr/bin/python 

# yum still needs 2.6, so write it in and backup script 
RUN cp /usr/bin/yum /usr/bin/_yum_before_27 
RUN sed -i s/python/python2.6/g /usr/bin/yum 
RUN sed -i s/python2.6/python2.6/g /usr/bin/yum 

# should display now 2.7.5 or later: 
RUN python -V 

# now install pip for 2.7 
RUN curl -o /tmp/ez_setup.py https://bootstrap.pypa.io/ez_setup.py

RUN /usr/bin/python27 /tmp/ez_setup.py 
RUN /usr/bin/easy_install-2.7 pip 
RUN pip install virtualenv

# should display current versions:
RUN pip -V && virtualenv --version
CMD ["/bin/bash"]
