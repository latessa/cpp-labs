# Use micromamba for fast, lightweight conda-based builds
FROM mambaorg/micromamba:latest

# Set working directory
WORKDIR /home/docker-user

# Copy environment definition
COPY environment.yml /home/docker-user/environment.yml

# Create environment in /opt/conda and activate it
RUN micromamba install -y -n base -f environment.yml \
    && micromamba clean -a -y

# Optional: copy notebooks or startup files
# COPY notebooks/ /home/docker-user/

# Set default command (Binder overrides this, but it's good practice)
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]

