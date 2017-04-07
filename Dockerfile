FROM scratch
ADD amzn-container-minimal-2017.03.0.20170401-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN mkdir /usr/src/srpm \
 && curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/srpm-bundle.tar.gz?versionId=eOPaBjB.7TEIToS3vvHMktlsQwnUWX96" \
 && echo "4ab23a8fffa5b6badfbf738e13bb10dd4d9700fde29a0c83c2b86362943a6974 /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
