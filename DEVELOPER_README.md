# Developer README: C++ Labs Notebook/Binder Workflow

This guide is for maintaining and running the C++ Jupyter notebook environment.

## 1) What each Dockerfile is for

### Root Dockerfile
Location: `Dockerfile`

Purpose:
- This is the Binder-facing Dockerfile used when Binder builds/runs this repo.
- It starts from a prebuilt base image (`jlatessa/cpp-env` pinned by digest) and copies the current repo content into `/home/jovyan`.

Why this helps:
- Environment setup is pre-baked in the base image, so Binder usually does less work at launch.
- Pinning by digest makes Binder builds reproducible.

### Builder Dockerfile
Location: `docker/Dockerfile`

Purpose:
- This builds the base image (`cpp-env`) that contains the notebook runtime and C++ kernel stack.
- It installs dependencies from `docker/environment.yml` using micromamba.

Why this helps:
- Environment changes are isolated from notebook/content changes.
- You can rebuild/push the base image only when dependencies change.

## 2) Environment definition

Location: `docker/environment.yml`

Key dependencies:
- `xeus-cling` (C++ Jupyter kernel)
- `notebook`
- `jupyterlab`

## 3) Local development (without Docker)

Use this when editing/running notebooks locally.

### First-time setup
```bash
conda env create -f docker/environment.yml -n cpp-env
conda activate cpp-env
jupyter lab
```

### If env already exists
```bash
conda activate cpp-env
jupyter lab
```

### If dependencies changed
```bash
conda env update -f docker/environment.yml -n cpp-env --prune
conda activate cpp-env
jupyter lab
```

## 4) Docker image publish workflow

Location: `.github/workflows/docker-deploy.yaml`

Workflow name:
- `docker-build`

How it works:
- Manual trigger (`workflow_dispatch`) with inputs:
  - `version` (tag like `latest` or `v1.0.1`)
  - `name` (image repo name, like `cpp-env`)
  - `path` (Dockerfile in `docker/`, usually `Dockerfile`)
- Builds from context `./docker`.
- Pushes to Docker Hub using secrets `DOCKER_USERNAME` and `DOCKER_PASSWORD`.

When to run:
- Run this only when `docker/environment.yml` (or base image build logic) changes.

After pushing a new image:
1. Update the root `Dockerfile` base image reference to the new digest/tag.
2. Commit and push so Binder uses the updated base image.

## 5) Notebook -> static HTML workflow

Location: `.github/workflows/convert-notebooks.yaml`

Workflow name:
- `Convert Notebooks to HTML for GitHub Pages`

How it works:
- Triggers on push/PR when any `*.ipynb` changes.
- Installs Jupyter on GitHub Actions runner.
- Detects added/modified notebooks.
- Converts changed notebooks to HTML in `docs/` using `nbconvert`.
- On pushes to `main`, auto-commits `docs/*.html` back to `main`.

Why this exists:
- Static HTML pages are available even when Binder is slow/unavailable.

## 6) Optional local validation commands

Check notebook conversion locally:
```bash
jupyter nbconvert Lab13/Lab13_Examples.ipynb --to html --template lab --output-dir docs
```

Check current conda env packages:
```bash
conda list
```
