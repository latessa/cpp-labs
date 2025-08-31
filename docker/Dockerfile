FROM mambaorg/micromamba:latest

# Use a neutral build directory to avoid polluting /home/jovyan
WORKDIR /tmp/build

COPY environment.yml .

RUN micromamba install -y -n base -f environment.yml && \
    micromamba clean -a -y

# Create /home/jovyan and make it writable for Binder
RUN mkdir -p /home/jovyan && chmod -R 777 /home/jovyan
