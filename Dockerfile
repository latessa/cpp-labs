FROM jlatessa/cpp-env@sha256:24af50645c50adfb101ebcfffcedaa40a374fa0f45a2bc0c1796b5fa54d6374e

COPY . /home/jovyan

USER jovyan
WORKDIR /home/jovyan
