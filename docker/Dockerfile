FROM mambaorg/micromamba:latest

# Set a non-root user and working directory
USER root
WORKDIR /home/jovyan

# Copy environment spec
COPY environment.yml .

# Install environment
RUN micromamba install -y -n base -f environment.yml && \
    micromamba clean -a -y

# Ensure permissions allow Binder to mount repo here
RUN chmod -R 777 /home/jovyan
