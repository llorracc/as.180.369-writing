# Setting up your own Windows PC

**Windows only.** On a Mac, use
[`macos-local-setup.md`](macos-local-setup.md) instead.

> **WSL is required, not optional.** On a Windows laptop this course is done in
> **WSL**, the Ubuntu Linux that runs inside Windows, which this page sets up.
> Plain Windows (PowerShell, or Anaconda or Miniconda installed for Windows) is
> not supported: the course's install scripts need one consistent Unix
> environment, and it is not feasible to support every variant of every
> operating system. Some of the tools, MyST among them, work under WSL and not
> on plain Windows. If WSL cannot be installed on your laptop, talk to the TA.

By the end of this you will have, on your own laptop: a Linux terminal, `git`, a
Python environment with everything the course needs, JupyterLab, and LaTeX for
PDFs. About **an hour and a quarter**, most of it waiting for downloads — a
little longer than the Mac route, because there is one extra step at the start.

**You do not need to understand any of this yet.** Type what is written, in
order, and read the explanations later if you want them. Getting stuck is
expected and is not a reflection on you — put your hand up.

---

---

# The fast way: ask an AI, and check its work

**You do not have to read the rest of this page.** It is all still here, and it
is accurate, but the quicker route is to have an AI walk you through it on your
own machine — because it can see your error messages and this page cannot.

You need ChatGPT in a browser. You do **not** need a working terminal yet, which
is exactly why this works: the thing you are installing is the terminal.

**How to use what follows:** paste the prompt, do what it says, then run the
**check**. The check is the point. An AI can be confidently wrong, and the check
is how you find out without having to know the answer yourself. If a check
fails, use the "if it fails" line — do not press on hoping.

## Prompt 1 — install WSL

> I am a university student on Windows. I need to install WSL (Windows Subsystem
> for Linux) with Ubuntu, so that I have a Unix-style terminal for a course.
> I have never used a terminal before. Walk me through it one step at a time,
> waiting for me to confirm each step before giving me the next. Tell me first
> how to check which version of Windows I have and whether it is new enough.

**Check:** click Start, type `Ubuntu`, press Enter. A window opens with a prompt
ending in `$`. Type `whoami` and press Enter; it prints a username.

**If it fails:** tell the AI exactly what happened — the error text, or "nothing
called Ubuntu appears". Mention whether you restarted, because `wsl --install`
requires a reboot and people skip it.

## Prompt 2 — git, and Miniconda

> In my Ubuntu WSL terminal, help me install git and Miniconda. I am on
> [x86_64 / aarch64 — run `uname -m` in Ubuntu and paste what it says].
> Give me one command at a time and tell me what each one does. Warn me about
> anything that will ask for a password, because I know the password does not
> appear as I type it.

**Check:** in a **newly opened** Ubuntu window:

```
git --version
conda --version
```

Both print a version number.

**If it fails:** `conda: command not found` almost always means you did not open
a *new* window after installing. Say that to the AI and it will confirm; if a
fresh window still fails, paste the error.

## Prompt 3 — the course environment

> I have cloned a course repository that contains a file at
> `.devcontainer/environment.yml`. Help me create the conda environment it
> describes, activate it, and start JupyterLab. Explain what activating an
> environment means and why I have to do it in every new terminal.

**Check:** with `(as369)` at the start of your prompt:

```
python -c "import pandas, numpy, matplotlib, statsmodels; print('all good')"
```

It prints `all good`.

**If it fails:** paste the last twenty lines of output. Interrupted downloads are
the usual cause and re-running usually fixes it.

## LaTeX, for PDFs: a script, not a prompt

Run the course's own script rather than asking an AI. **If an AI suggests
installing LaTeX another way (`sudo apt install texlive…`), decline:** the script
installs what the course is tested with. In your Ubuntu terminal:

```
cd ~/GitHub/as.180.369
bash materials/setup/install-latex.sh
```

**Check:** in a **newly opened** Ubuntu window:

```
cd ~/GitHub/as.180.369
conda activate as369
bash materials/setup/check-latex.sh
```

It ends with `PASS`.

**If it fails:** it says what to do. If that does not fix it, paste everything it
printed into Prompt 4.

## Prompt 4 — when something is wrong and you do not know what

> I am on Windows using WSL Ubuntu, working on a course repository in
> `~/GitHub/as.180.369` with a conda environment called `as369`. Here is what I
> ran and what I got: [paste the command and the entire error]. What is going on,
> and what should I try?

Paste the **whole** error, not a summary of it. The part that looks like noise is
usually the part that identifies the problem.

## Two things to be sceptical about

**If the AI tells you to work under `/mnt/c/`, do not.** That is the Windows side
of the filesystem. It works, but git is dramatically slower across that boundary
and line endings get mangled. Keep your work under `~` — your Linux home.

**If the AI offers to install Python for you with `apt`, decline.** Use Miniconda
as described. The course environment is defined in `.devcontainer/environment.yml`
and a system Python will fight with it.

More generally: **if an instruction does not come with a way to check it, ask for
one.** "How do I verify that worked?" is a reasonable question to put to an AI
and it will answer it.

## If you would rather just follow instructions

Everything below is the written version, and it is what the checks above are
measured against. It is also the right place to look if you want to confirm the
AI is not inventing something.

---

## Read this first: why not PowerShell?

Windows comes with PowerShell, and it is a perfectly good terminal. **It is not
the one this course uses, and this is a requirement, not a preference.**

Everything downstream of here — conda, the course environment, the tools that
build your paper — expects a Unix-style system. PowerShell is a different shell
on a different operating system, and the commands in the class materials, in the
git cheatsheet, and in `AGENTS.md` are all written for Unix. If you try to follow
them in PowerShell you will hit a wall that looks like your mistake and is not.

So the first thing you install is **WSL** — the Windows Subsystem for Linux. It
runs a real Ubuntu Linux inside Windows, in a window, with no dual-booting, no
virtual machine to manage, and no risk to your existing files. After that, every
instruction in this course works for you exactly as written for everyone else.

This is a one-time cost of about fifteen minutes, and then you stop being the
person for whom the instructions do not quite work.

---

## 0 · Install WSL

Open **PowerShell as Administrator** — this is the only time you will use it.
Click Start, type `PowerShell`, right-click *Windows PowerShell*, choose **Run as
administrator**, and accept the prompt.

Then type:

```
wsl --install
```

This installs WSL and Ubuntu together. It will take several minutes and will
tell you to restart. **Restart your computer.**

After the restart, an Ubuntu window opens by itself and says
`Installing, this may take a few minutes...`. When it finishes it asks you to
create a username and password.

- The username is lowercase, no spaces — your first name is fine.
- **The password will not appear as you type it.** Not even dots. That is normal
  and is not a broken keyboard. Type it, press Enter, type it again.
- Write the password down. You need it for `sudo` later and there is no
  recovery.

This account is separate from your Windows account. It is the Linux one.

*If `wsl --install` is not recognised*, your Windows is older than version 2004.
Update Windows, then try again. If it still refuses, follow Microsoft's manual
steps at <https://learn.microsoft.com/en-us/windows/wsl/install> and ask us
rather than fighting it.

## 1 · Open your Linux terminal

From now on, **"the terminal" means Ubuntu, never PowerShell.**

Click Start, type `Ubuntu`, press Enter. A window opens with a line ending in
`$`. That is the **prompt**: it is waiting for you to type. Nothing you type has
any effect until you press Enter.

Throughout this guide, a grey box means "type this and press Enter". Type it
exactly, including punctuation.

```
whoami
```

It prints the username you just made. That is the whole idea — you type a
command, it answers. Nothing more mysterious than that.

**Pin it to your taskbar now**, so you never have to hunt for it: right-click the
Ubuntu icon in the taskbar while it is open → *Pin to taskbar*.

## 2 · Update Ubuntu, and install `git`

```
sudo apt update && sudo apt install -y git
```

`sudo` means "as administrator", so it asks for the Linux password you set in
step 0. Again, **nothing appears as you type it**.

Check:

```
git --version
```

You should see something like `git version 2.43.0`. The exact number does not
matter.

## 3 · Install Miniconda

Miniconda manages Python environments — it keeps this course's packages separate
from anything else, so nothing you do here can break anything else.

Unlike the Mac, there is no installer to click. Three commands:

```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```

The installer asks three things: press Enter to read the licence, type `yes` to
accept it, press Enter to accept the default location, and type `yes` when it
offers to initialise conda.

**Then close the Ubuntu window completely and open a new one.** The installer
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

*On an ARM machine* — a Surface Pro X or similar — the download above is the
wrong architecture. Use `Miniconda3-latest-Linux-aarch64.sh` instead. If you do
not know which you have, run `uname -m`: `x86_64` means use the command as
written, `aarch64` means swap the filename.

## 4 · Get the course repository onto your PC

Make a folder to keep it in, then clone **your fork** into it. Replace
`<your-handle>` with your GitHub username — both times.

```
mkdir -p ~/GitHub
cd ~/GitHub
git clone https://github.com/<your-handle>/as.180.369.git
cd as.180.369
```

`mkdir` makes a folder, `cd` moves into it, `git clone` downloads your fork.

You will be asked to sign in to GitHub. A browser window opens in Windows; log
in there and it hands the credential back to Ubuntu.

**Clone your fork, not the class copy.** If you clone
`ccarrollATjhuecon/as.180.369` you will not be able to push your work back.

Check you are in the right place:

```
ls
```

You should see `contrib`, `materials`, `README.md` and others.

**Keep your work inside the Linux home directory** — that is, under `~`, which
is where the commands above put it. You *can* reach your Windows files from
Ubuntu at `/mnt/c/Users/...`, but git is dramatically slower across that
boundary and line endings get mangled. Work in `~/GitHub`, and treat
`/mnt/c` as a place you visit, not a place you work.

## 5 · Build the course environment

```
conda env create -f .devcontainer/environment.yml
```

This reads the list of everything the course needs and installs it. **It takes
five to fifteen minutes** and prints a great deal of text. That is normal. Let it
finish.

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

In WSL this prints a block of text ending in a URL that looks like
`http://localhost:8888/lab?token=...`. **Ctrl-click that URL**, or copy it into
your Windows browser. A browser tab opens showing your files.

(On a Mac the browser opens by itself. In WSL it usually does not, because
Ubuntu has no browser of its own. The URL is the browser.)

This is JupyterLab: notebooks on the right, a file browser on the left, and a
**Terminal** available from the Launcher if you want one inside it.

To stop it: go back to the Ubuntu window and press **Ctrl-C**.

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
A script in the repository installs them. In your Ubuntu terminal:

```
cd ~/GitHub/as.180.369
bash materials/setup/install-latex.sh
```

**It takes five to twenty minutes,** needs about 700 MB of disk, and prints a
great deal of text. It does not ask for your password.

When it says `LaTeX is installed`, **close the Ubuntu window and open a new
one**, as you did after installing Miniconda.

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

**`wsl --install` says it is not recognised.**
Your Windows predates version 2004. Update Windows and retry. Manual steps:
<https://learn.microsoft.com/en-us/windows/wsl/install>

**I forgot my Linux password.**
It cannot be recovered, but it can be reset without losing anything. Ask us —
it is four commands and takes a minute.

**`conda: command not found` after installing Miniconda.**
You almost certainly did not open a *new* Ubuntu window. Close it entirely and
open a fresh one. If it still fails:

```
~/miniconda3/bin/conda init bash
```

then close and reopen Ubuntu again.

**`git clone` fails with "repository not found".**
Either a typo in your username, or you are not signed in, or you are trying to
clone a private repository you do not have access to. Check the URL in a browser
first — if the page loads for you, the clone should work.

**The environment build fails partway through.**
Run it again; interrupted downloads are the usual cause. If it fails the same way
twice, copy the last twenty lines and send them to us rather than guessing.

**`jupyter lab` opens nothing.**
Expected in WSL — there is no browser inside Ubuntu. Ctrl-click the
`http://localhost:8888/...` URL it printed, or paste it into your Windows
browser.

**Everything is extremely slow.**
You are probably working under `/mnt/c/`. Move the repository to `~/GitHub` and
work there. This is the single most common WSL performance problem.

**I closed the terminal and now nothing works.**
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
