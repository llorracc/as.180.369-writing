#!/usr/bin/env bash
# Build the course environment inside the container. Runs once, on create.
set -euo pipefail

echo "==> creating the as369 conda environment"
conda env create -f .devcontainer/environment.yml -n as369

# Register it as a Jupyter kernel so notebooks find it without being told.
conda run -n as369 python -m ipykernel install --user --name as369 \
  --display-name "AS.180.369"

# Make it the default in every new terminal.
echo 'conda activate as369' >> ~/.bashrc

echo
echo "==> checking the things the course actually needs"
conda run -n as369 python - <<'PY'
import importlib
for m in ("pandas", "numpy", "matplotlib", "statsmodels", "fredapi"):
    importlib.import_module(m)
    print(f"    {m} ok")
PY
conda run -n as369 myst --version | sed 's/^/    myst /'

# `myst build --pdf` shells out to LaTeX (the paper template, arxiv_nips, is a
# LaTeX template), and LaTeX is not in the conda environment: it is TinyTeX,
# installed by materials/setup/install-latex.sh and checked by check-latex.sh.
echo "    latex: $(command -v latexmk || echo 'not installed -- bash materials/setup/install-latex.sh')"

echo
echo "Ready. Open a terminal and the as369 environment is already active."
