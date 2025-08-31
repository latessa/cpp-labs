FROM jlatessa/cpp-env@sha256:f68b724004781c1f25211a9edb72f6451c4871a3e4672f6e053655c8cba16ef9

# Copy repo contents so notebooks appear in Binder
COPY . /home/jovyan
USER root
RUN chown -R jovyan:users /home/jovyan
USER jovyan
