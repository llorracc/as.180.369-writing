#!/usr/bin/env bash
# Install LaTeX for this course: TinyTeX, a small TeX Live, plus the two
# collections of LaTeX packages that the course's PDFs need. Those are your
# paper's PDF (`myst build --pdf`) and a notebook saved as a PDF
# (`jupyter nbconvert --to pdf`).
#
#   bash materials/setup/install-latex.sh
#
# Run it in the Terminal on a Mac, or in your WSL Ubuntu terminal on Windows.
# It needs about 700 MB of disk and takes 5 to 20 minutes, most of it
# downloading. It does not use the course environment. Running it again is
# safe: it keeps what is already installed.
#
# Then open a NEW terminal window and check LaTeX with
# materials/setup/check-latex.sh.

set -euo pipefail

case "$(uname -s)" in
    Darwin) tinytex="$HOME/Library/TinyTeX" ;;
    Linux)  tinytex="$HOME/.TinyTeX" ;;
    *)      echo "This script is for a Mac, or for WSL Ubuntu on Windows." >&2
            exit 1 ;;
esac

# TinyTeX is there when its folder has these three programs.
installed() {
    bin=$(ls -d "$tinytex"/bin/*/ 2>/dev/null | head -n 1)
    [ -n "$bin" ] && [ -x "$bin/tlmgr" ] && [ -x "$bin/latexmk" ] && [ -x "$bin/xelatex" ]
}

# 1. TinyTeX itself (about 60 MB), by TinyTeX's own installer, which also puts
#    LaTeX on your PATH. On a Mac it may ask for your password to do that.
if installed; then
    echo "==> TinyTeX is already installed in $tinytex"
else
    echo "==> Installing TinyTeX into $tinytex"
    url=https://yihui.org/tinytex/install-bin-unix.sh
    if command -v curl >/dev/null; then fetch="curl -fsSL $url"; else fetch="wget -qO- $url"; fi
    if ! $fetch | sh || ! installed; then
        echo >&2
        echo "TinyTeX did not install: show the messages above to the TA." >&2
        exit 1
    fi
fi
tlmgr="${bin}tlmgr"

# 2. The packages. tlmgr, TinyTeX's package manager, must update itself before
#    it will install anything.
echo "==> Updating tlmgr"
"$tlmgr" update --self
echo "==> Installing the LaTeX packages: about 2,000 of them, the long part"
if ! "$tlmgr" install collection-latexextra collection-fontsrecommended; then
    echo >&2
    echo "Not every package installed: read the messages above. A dropped" >&2
    echo "connection is the usual cause. Run this script again; it carries on." >&2
    exit 1
fi

echo
echo "LaTeX is installed. Close this terminal window, open a new one, and check it:"
echo
echo "    cd ~/GitHub/as.180.369"
echo "    conda activate as369"
echo "    bash materials/setup/check-latex.sh"
