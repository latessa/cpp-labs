FROM jlatessa/cpp-env@sha256:ad6a4cb3cf59b0887c7c05165a8d7e45c4666cf8ed38482ad0dbc989087152a1

RUN id -u jovyan &>/dev/null || useradd -m -s /bin/bash -N -u 1000 -g users jovyan

COPY . /home/jovyan

RUN chown -R jovyan:users /home/jovyan

USER jovyan
WORKDIR /home/jovyan
