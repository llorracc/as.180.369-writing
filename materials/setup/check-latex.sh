#!/usr/bin/env bash
# Check that LaTeX works for this course, after install-latex.sh. Run it in a
# new terminal window, with the course environment active:
#
#   conda activate as369
#   bash materials/setup/check-latex.sh
#
# It makes two short PDFs in a temporary folder, one for each way you will
# make a PDF this term:
#   - a MyST document set up like your paper (`myst build --pdf`);
#   - a notebook (`jupyter nbconvert --to pdf`, which is also what JupyterLab's
#     File > Save and Export Notebook As > PDF runs).
# It ends with PASS, or with FAIL and what to do about it.

set -uo pipefail

fail() {
    echo
    echo "FAIL: $1"
    shift
    for line in "$@"; do echo "    $line"; done
    exit 1
}

case "$(uname -s)" in
    Darwin) tinytex="$HOME/Library/TinyTeX" ;;
    *)      tinytex="$HOME/.TinyTeX" ;;
esac
case "${SHELL##*/}" in
    zsh) rc="~/.zshrc" ;;
    *)   [ "$(uname -s)" = Darwin ] && rc="~/.bash_profile" || rc="~/.bashrc" ;;
esac

echo "==> LaTeX"
for p in latexmk xelatex; do
    if ! command -v "$p" >/dev/null; then
        bin=$(ls -d "$tinytex"/bin/*/ 2>/dev/null | head -n 1)
        [ -n "$bin" ] || fail "LaTeX is not installed. Install it with:" \
            "bash materials/setup/install-latex.sh"
        fail "TinyTeX is installed, but this terminal cannot find it." \
            "Close this terminal window, open a new one, and run this check again." \
            "If it fails the same way, run this line, then open a new window:" \
            "echo 'export PATH=\"\$PATH:${bin%/}\"' >> $rc"
    fi
    echo "    $p: $(command -v "$p")"
done
texroot=$(kpsewhich -var-value=TEXMFROOT 2>/dev/null)
echo "    TeX in use: $texroot"

echo "==> The course environment"
env_name=${CONDA_DEFAULT_ENV:-}
for p in myst jupyter pandoc; do
    command -v "$p" >/dev/null && continue
    if [ -z "$env_name" ] || [ "$env_name" = base ]; then
        fail "'$p' is not found. Activate the course environment first:" \
            "conda activate as369"
    fi
    case $p in
        myst)    pkg='"mystmd>=1.10.1" "nodejs=24"' ;;
        jupyter) pkg='jupyterlab nbconvert' ;;
        pandoc)  pkg='pandoc' ;;
    esac
    fail "Your environment, $env_name, has no '$p'. Add it with:" \
        "conda install -n $env_name -c conda-forge $pkg"
done
myst_version=$(myst --version 2>/dev/null | tail -n 1 | tr -d 'v[:space:]')
echo "    $env_name, with MyST $myst_version"
if ! python -c 'import re, sys; sys.exit(tuple(int(x) for x in re.findall(r"\d+", sys.argv[1])[:3]) < (1, 10, 1))' "$myst_version"; then
    fail "Your MyST, $myst_version, is older than the course's. Update it with:" \
        "conda install -n $env_name -c conda-forge \"mystmd>=1.10.1\" \"nodejs=24\""
fi
# An environment built from the course's older environment file has texlive-core,
# whose latexmk, bibtex and tlmgr come before TinyTeX's on the PATH. Its bibtex
# cannot find the paper's bibliography style, so the paper's PDF fails.
if ls "${CONDA_PREFIX:-/nonexistent}"/conda-meta/texlive-core-*.json >/dev/null 2>&1; then
    fail "Your environment, $env_name, still has texlive-core, which the course" \
        "no longer uses: it hides TinyTeX's LaTeX. Remove it with:" \
        "conda remove -n $env_name texlive-core"
fi

work=$(mktemp -d "${TMPDIR:-/tmp}/latex-check.XXXXXX") || exit 1
cd "$work" || exit 1

# What went wrong, read from the logs named. A missing LaTeX file means the
# packages are incomplete, or that another LaTeX comes first on the PATH.
explain() {
    missing=$(grep -rhoE "File \`[^']+' not found" "$@" 2>/dev/null | head -n 1 |
              sed -E "s/File \`([^']+)' not found/\1/")
    if [ -n "$missing" ] && [[ $texroot != *TinyTeX* ]]; then
        fail "LaTeX could not find $missing. The LaTeX this terminal uses is not" \
            "TinyTeX but $texroot. Show this to the TA."
    elif [ -n "$missing" ]; then
        fail "LaTeX could not find $missing: its packages are incomplete." \
            "Run the install again; it keeps what is already there:" \
            "bash materials/setup/install-latex.sh"
    fi
    echo "The last lines it printed:"
    # (without MyST's "Update available" box: the course pins MyST's version)
    grep -vE '╭|╮|╰|╯|│|^[[:space:]]*$' "$1" | tail -n 20 | sed 's/^/    /'
    fail "The PDF was not made. Send the lines above to the TA." \
        "Everything it made is in $work"
}

pdf_made() { [ -s "$1" ] && tail -c 1024 "$1" | grep -q '%%EOF'; }

echo "==> A MyST document, set up like your paper (myst build --pdf)"
cat > myst.yml <<'EOF'
version: 1
project:
  title: LaTeX check
  authors:
    - name: A. Student
  bibliography:
    - references.bib
  exports:
    - format: pdf
      template: arxiv_nips
      output: myst-check.pdf
      title: LaTeX check
      articles:
        - file: paper.md
          level: 0
  toc:
    - file: paper.md
EOF
cat > paper.md <<'EOF'
---
title: LaTeX check
---

+++ {"part": "abstract"}
A short document, set up like your paper.

+++

# Introduction

Stock returns are hard to predict {cite:p}`Fama1970`. Write the return in
period $t$ as

$$
r_t = \mu + \varepsilon_t ,
$$ (returns)

where $\mu$ is the mean and $\varepsilon_t$ the surprise.

# Conclusion

Equation [](#returns) has two parts.
EOF
cat > references.bib <<'EOF'
@article{Fama1970,
  author  = {Fama, Eugene F.},
  title   = {Efficient Capital Markets: A Review of Theory and Empirical Work},
  journal = {The Journal of Finance},
  volume  = {25},
  number  = {2},
  pages   = {383--417},
  year    = {1970}
}
EOF
myst build --pdf > myst.log 2>&1
if pdf_made myst-check.pdf; then
    echo "    made myst-check.pdf"
else
    explain myst.log _build
fi

echo "==> A notebook (jupyter nbconvert --to pdf)"
cat > notebook-check.ipynb <<'EOF'
{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "intro",
   "metadata": {},
   "source": [
    "# LaTeX check\n",
    "\n",
    "A notebook saved as a PDF, with an equation: $r_t = \\mu + \\varepsilon_t$."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "code",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "mean return: 0.05\n"
     ]
    }
   ],
   "source": [
    "print(\"mean return:\", 0.05)"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "name": "python"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
EOF
jupyter nbconvert --to pdf notebook-check.ipynb > nbconvert.log 2>&1
if pdf_made notebook-check.pdf; then
    echo "    made notebook-check.pdf"
else
    explain nbconvert.log
fi

echo
echo "PASS: LaTeX works for the course."
echo "The two PDFs are in $work"
if [ "$(uname -s)" = Darwin ]; then
    echo "To look at them: open $work"
elif command -v wslpath >/dev/null; then
    echo "To look at them: explorer.exe \"\$(wslpath -w $work)\""
fi
