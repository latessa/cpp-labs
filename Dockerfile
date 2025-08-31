FROM jlatessa/cpp-env@sha256:cbd44d40b1c8f192f9ce030210e1e4bc98ae6b876c67e6601b9eb6853658ae6d

RUN id -u jovyan &>/dev/null || useradd -m -s /bin/bash -N -u 1000 -g users jovyan

COPY . /home/jovyan

RUN chown -R jovyan:users /home/jovyan

USER jovyan
WORKDIR /home/jovyan
