FROM jlatessa/cpp-env@sha256:fd482fb4bb01db2e4b949c40d9eb8373b8fe20dd4a5772fbf013eaeacf12ce48

RUN id -u jovyan &>/dev/null || useradd -m -s /bin/bash -N -u 1000 -g users jovyan

COPY . /home/jovyan

RUN chown -R jovyan:users /home/jovyan

USER jovyan
WORKDIR /home/jovyan
