FROM jlatessa/cpp-env@sha256:42075c73cdf4897b932056d4a843eb86dcb07523fb0e0e5908bcf74ae7a2c83c

COPY . /home/jovyan

USER jovyan
WORKDIR /home/jovyan
