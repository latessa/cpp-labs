FROM mambaorg/micromamba:latest

# Use a neutral build directory
WORKDIR /tmp/build

COPY environment.yml .

RUN micromamba install -y -n base -f environment.yml && \
    micromamba clean -a -y

# Ensure /home/jovyan is writable but untouched
RUN chmod -R 777 /home/jovyan
