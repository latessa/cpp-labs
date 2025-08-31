FROM jlatessa/cpp-env@sha256:f68b724004781c1f25211a9edb72f6451c4871a3e4672f6e053655c8cba16ef9

RUN id -u jovyan &>/dev/null || useradd -m -s /bin/bash -N -u 1000 -g users jovyan

COPY . /home/jovyan

RUN chown -R jovyan:users /home/jovyan

USER jovyan
WORKDIR /home/jovyan
