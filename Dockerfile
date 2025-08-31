FROM jlatessa/cpp-env@sha256:1583265508ea04637fc8303861c8418c5d137c3a94e3c01133ac65d0c76472d8

RUN id -u jovyan &>/dev/null || useradd -m -s /bin/bash -N -u 1000 -g users jovyan

COPY . /home/jovyan

RUN chown -R jovyan:users /home/jovyan

USER jovyan
WORKDIR /home/jovyan
