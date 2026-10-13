# Setting up your own Mac

**macOS only.** On Windows, use
[`windows-local-setup.md`](windows-local-setup.md) — it starts by installing
WSL, and then everything is the same as here.

By the end of this you will have, on your own laptop: `git`, a Python
environment with everything the course needs, JupyterLab, and LaTeX for PDFs.
About **an hour**, most of it waiting for downloads.

**You do not need to understand any of this yet.** Type what is written, in
order, and read the explanations later if you want them. Getting stuck is
expected and is not a reflection on you — put your hand up.

---

## 0 · Open the Terminal

Press **⌘-Space**, type `Terminal`, press **Return**.

A window opens with a line ending in `%`. That is the **prompt**: it is waiting
for you to type. Nothing you type has any effect until you press Return.

Throughout this guide, a grey box means "type this and press Return". Type it
exactly, including punctuation.

```
whoami
```

It prints your username. That is the whole idea — you type a command, it
answers. Nothing more mysterious than that.

## 1 · Which Mac do you have?

This changes what you download, so check rather than guess.

Click the  menu (top-left) → **About This Mac**. Look at **Chip** or
**Processor**:

- `Apple M1` / `M2` / `M3` / `M4` → you have **Apple Silicon**
- anything starting `Intel` → you have **Intel**

Write down which. You need it once, in step 3.

## 2 · Install the Apple developer tools (this gives you `git`)

```
xcode-select --install
```

A dialog appears. Click **Install**, accept the licence, wait. It is a large
download — five to fifteen minutes on campus wifi.

If it says *"command line tools are already installed"*, good: skip ahead.

When it finishes, check:

```
git --version
```

You should see something like `git version 2.39.5`. The exact number does not
matter.

## 3 · Install Miniconda

Miniconda manages Python environments — it keeps this course's packages
separate from anything else on your machine, so nothing you do here can break
anything else.

Download the **`.pkg`** installer (not the shell script) from
<https://www.anaconda.com/download/success>, under *Miniconda Installers*:

- **Apple Silicon** → `Miniconda3 macOS Apple M1 64-bit pkg`
- **Intel** → `Miniconda3 macOS Intel x86 64-bit pkg`

Open the downloaded file and click through the installer. Accept the defaults.

**Then close the Terminal window completely and open a new one.** The installer
changes your shell setup, and an already-open window will not have noticed.

Check:

```
conda --version
```

`conda 25.x.x` or similar. If instead you get `command not found`, see
Troubleshooting below.

**One optional tidy-up**, which stops conda hijacking every terminal you open:

```
conda config --set auto_activate_base false
```

## 4 · Get the course repository onto your Mac

Make a folder to keep it in, then clone **your fork** into it. Replace
`<your-handle>` with your GitHub username — both times.

```
mkdir -p ~/GitHub
cd ~/GitHub
git clone https://github.com/<your-handle>/as.180.369.git
cd as.180.369
```

`mkdir` makes a folder, `cd` moves into it, `git clone` downloads your fork.

You will be asked to sign in to GitHub. A browser window opens; log in there.

**Clone your fork, not the class copy.** If you clone
`ccarrollATjhuecon/as.180.369` you will not be able to push your work back.

Check you are in the right place:

```
ls
```

You should see `contrib`, `materials`, `README.md` and others.

## 5 · Build the course environment

```
conda env create -f .devcontainer/environment.yml
```

This reads the list of everything the course needs and installs it. **It takes
five to fifteen minutes** and prints a great deal of text. That is normal. Let
it finish.

Then switch into it:

```
conda activate as369
```

Your prompt now starts with `(as369)`. That tells you which environment you are
in — you will need to do this `activate` step in every new terminal window.

## 6 · Start JupyterLab

```
jupyter lab
```

A browser tab opens showing your files. This is JupyterLab: notebooks on the
right, a file browser on the left, and a **Terminal** available from the
Launcher if you want one inside it.

To stop it: go back to the Terminal window and press **⌃-C** (control and C).

## 7 · Check everything works

With `(as369)` showing in your prompt:

```
python -c "import pandas, numpy, matplotlib, statsmodels; print('all good')"
```

If it prints `all good`, the environment works.

## 8 · Install LaTeX, for PDFs

**Set up before 12 October 2026?** This step is new: do just this one. The check
at its end tells you if your environment needs anything else.

Your paper's PDF, and a notebook saved as a PDF, are typeset by **LaTeX**. The
course uses **TinyTeX**, a small LaTeX, with two collections of LaTeX packages.
A script in the repository installs them:

```
cd ~/GitHub/as.180.369
bash materials/setup/install-latex.sh
```

**It takes five to twenty minutes,** needs about 700 MB of disk, and prints a
great deal of text. If it stops to ask for your **password**, type your Mac login
password and press Return. Nothing appears as you type; that is normal. It needs
the password to put LaTeX where every Terminal window can find it.

When it says `LaTeX is installed`, **close the Terminal window completely and
open a new one**, as you did after installing Miniconda.

Check that it worked:

```
cd ~/GitHub/as.180.369
conda activate as369
bash materials/setup/check-latex.sh
```

In about ten seconds it makes two short PDFs, one with MyST as your paper is
made and one from a notebook, and ends with **`PASS`**. If it ends with `FAIL`,
it says what to do. If that does not fix it, send us everything it printed.

---

## Troubleshooting

**`conda: command not found` after installing Miniconda.**
You almost certainly did not open a *new* Terminal window. Close it entirely
(⌘-Q) and open a fresh one. If it still fails:

```
~/miniconda3/bin/conda init zsh
```

then close and reopen the Terminal again.

**`git clone` fails with "repository not found".**
Either a typo in your username, or you are not signed in, or you are trying to
clone a private repository you do not have access to. Check the URL in a browser
first — if the page loads for you, the clone should work.

**The environment build fails partway through.**
Run it again; interrupted downloads are the usual cause. If it fails the same
way twice, copy the last twenty lines and send them to us rather than guessing.

**`jupyter lab` says command not found.**
You are not in the environment. Run `conda activate as369` and try again. Check
your prompt starts with `(as369)`.

**I closed the Terminal and now nothing works.**
Nothing is broken. Each new window starts fresh:

```
cd ~/GitHub/as.180.369
conda activate as369
```

That is the two-line ritual at the start of every session.

---

## What to do next

Now that you have a terminal and a clone, the four commands you will use all
semester are in
a git cheatsheet (not included in this copy):
`git status`, `git add`, `git commit`, `git push`. Its screenshots are of a
different setup, but the commands are the same and its FAQ is worth reading
before you need it.
