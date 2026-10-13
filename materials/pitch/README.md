# “The Pitch”

## Overview

In the pitch phase of this course, you will create a pitch for a compelling
research paper.

## Class 2

**Bring your laptop, charged.** Most of this session is you doing things on your
own machine.

This is the class where you meet AI agents that can act on your files and on your
repository, rather than ones you paste text into. **Nothing costs money.**

### Before you come

- [ ] **Apply for GitHub Education** if you have not. A plain free GitHub account
      does not have it — you apply with the account you already have and it gets
      upgraded. Verification takes days, so do it before the weekend ends.
- [ ] **Check you can log in to ChatGPT.** The free plan is enough.
- [ ] **Your Dennett summary committed, and your pull request open.** If it is
      not, come anyway — we sort it out together in the first fifteen minutes.
      That is why this one is due *in* class.
- [ ] **Mac users:** skim [`materials/setup/macos-local-setup.md`](../setup/macos-local-setup.md).
      On Monday we only use the first part of it — opening a terminal — but it is
      worth having seen the words once.

### What we do

**3:00 — GitHub tutorial (20 min).** We will watch
[*GitHub Tutorial for Beginners (2025)*](https://www.youtube.com/watch?v=v5gnvDUWqFM).
It gives a plain-English introduction to repositories, commits, pushing,
pulling, and undoing changes. It uses GitHub Desktop; we will use the terminal,
but the ideas are the same.

**3:20 — Opening a terminal (10 min).** Three commands, so that a prompt stops
being frightening.

**3:30 — Codex: the agent that comes to your files (25 min).** Installed on your
own machine, connected to your ChatGPT account, pointed at your own copy of the
repository. Getting this working is the first thing we do, because everything
after it depends on it.

Your first instruction to it will be something small and real, like *"add my
name and my major or majors to my Dennett assignment markdown document."* Then
we look at `git status` and `git diff` together and see that a program edited a
file on your own machine — and that you can undo it in one command if you do not
like what it did.

**3:55 — Handing in, with Codex doing the work (30 min).** Most of you have your
Dennett summary committed to `main` in your fork. It needs to be on a branch of
its own before it can become a pull request — and rather than my talking you
through the git for that, you are going to ask Codex to do it.

The order matters, and it is not the obvious one:

1. **First, your work goes onto a branch of its own.** Nothing is lost and
   nothing is changed — a branch made from where you are carries all your
   commits with it. This is safe, and it has to happen before step 2.
2. **Then you sync your fork with the course repository.** This is the first
   real job you give Codex. It brings you every course update you have missed,
   including a new file called `AGENTS.md` — instructions written for AI agents
   explaining how this repository works.
3. **Then Codex reads `AGENTS.md`**, and from that point the file does the
   explaining rather than me. Opening your pull request, the naming rules, what
   the automatic check will reject — it is all in there.

That is the whole idea of the session in one exercise: a program doing real work
on your own files, where you can see every step and stop it.

**4:25 — Break (10 min).**

**4:35 — Copilot: the agent that works through the process (25 min).** The
contrast. Codex came to your files; Copilot works through the issue-and-pull-request
process you are already using.

**You write an issue.** That is your half, and it is the half that matters:
describing a change precisely enough that something which cannot ask you
questions can carry it out. You will write a real one — asking for the markdown
exercise in your own `contrib/<your-handle>/README.md` to be finished, with the
requirements spelled out.

**Then we watch an agent pick it up**, work on a branch, and open a pull request,
which we review together on the projector. Reviewing is the interesting part.
The issue you write will include one fiddly requirement — that an embedded image
must use a relative path rather than a full GitHub URL — and it is worth seeing
whether the agent honours it. If it does not, you have learned the real lesson:
the review step is not a formality.

**5:00 — Paperpile and the JEP library (20 min).** You need this working for the
homework, so say so in the room if it will not. We go step by step: the Chrome
extension, saving a paper in one click, connecting the JHU library so PDFs
arrive, starting your assigned JEP issue, folders and labels, citing, and
exporting BibTeX. **Bring Chrome** — Paperpile is built around it.

**Your JEP issue is already assigned** — one each, and no two the same:
`this-year/jep-issue-assignments.md` (not included in this copy).
Each is an issue the shared library does not yet have, so the homework grows the
library instead of copying out of it.

Paperpile's own guides, for during class and after it:
**[Paperpile Help Center](https://paperpile.com/help/)** — one page that leads to
everything we cover: getting started, the browser extension, Google Docs and
Word, BibTeX, and the Paperpile guide, which has the library proxy, PDFs, folders
and sharing.

**One thing that surprises people:** a shared folder gives you the *references*,
not the PDFs. You fetch the PDFs yourself, through the JHU library connection.

**5:20 — Choosing a topic (10 min).**

### One thing to be clear about

**Your Dennett summary is your writing.** The commit history is graded as
evidence of *your* thinking as it developed. These agents are powerful and this
is not what they are for. You will be told when using them is the point — on that
assignment, it is not.

### <a id="class02-assignment"></a>Homework, due before Class 3

- [ ] **Choose TWO topics** — two genuinely different research projects, not one
      topic and a variation on it.
- [ ] **Browse the JEP shared library** for ideas; other sources are welcome too.
- [ ] **Build your assigned JEP issue into your own Paperpile library.** Each of
      you has an issue the shared library does *not* yet have, so there is
      nothing to drag — you add it yourself: open the issue's page on the AEA
      website, save every article with the Paperpile Chrome extension, and let
      the PDFs come through the JHU library connection. **Your issue is listed in
      `this-year/jep-issue-assignments.md` (not included in this copy)**
      — you do not have to remember what was said in class. When you are done,
      the TA folds your finished issue into the course library, so the next class
      starts with it.

      All of this happens in **your own** Paperpile. You do not need access to
      any shared library, and you should not wait for one.
- [ ] **Write one paragraph on each of your two projects** — two separate
      paragraphs about two *different* research projects, each giving the
      question and your initial hypothesis. Not two paragraphs about one
      project. Put both in
      `contrib/<your-handle>/assignments/class02-topic.md` — that filename
      exactly, and **on a new branch of its own**. See below.

      **Why two.** You are not committing to either one yet. Having two on the
      table means the class-3 discussion can be about which is the better
      project and why, rather than about how to rescue the only one you brought.
      Bringing two weak ideas is more useful than bringing one polished one.
- [ ] ChatGPT or Claude is welcome for this one.

**How to hand this one in — it does NOT go in your Dennett pull request.**

From now on the rule is one assignment, one branch, one pull request. Start from
an up-to-date `main`:

```bash
git switch main
git pull                                   # or press "Sync fork" on GitHub
git switch -c <your-handle>/class02-topic
# write contrib/<your-handle>/assignments/class02-topic.md, then:
git add contrib/<your-handle>/assignments/class02-topic.md
git commit -m "Class 2: topic and hypothesis"
git push -u origin <your-handle>/class02-topic
```

Then open a pull request from that branch.

**Leave your Dennett pull request open and alone.** It is still being marked,
and nothing you do here touches it.

Stuck? Ask Codex: *"Read AGENTS.md, then start a new branch for the class02
topic assignment and show me what you did before pushing."*

## Class 3 — choosing your project, and getting Python working

**Bring your laptop, charged.** The second half of this class is you installing
things on your own machine.

### Before you come — Windows users, this one has a reboot in it

- [ ] **On Windows: install WSL first.** Not PowerShell — **WSL**, which runs a
      real Linux inside Windows. It takes about fifteen minutes **and a
      restart**, so it cannot be done at 3:05 in the room. Full instructions:
      [`materials/setup/windows-local-setup.md`](../setup/windows-local-setup.md).
      Come having done at least step 0.
- [ ] **On a Mac:** nothing to do beforehand, but skimming
      [`materials/setup/macos-local-setup.md`](../setup/macos-local-setup.md)
      will make the hour easier.
- [ ] **Your two topic paragraphs committed, and the pull request open** — on a
      branch of its own, `<your-handle>/class02-topic`.
- [ ] **Your JEP issue built into your own Paperpile.** Which issue is yours:
      `this-year/jep-issue-assignments.md` (not included in this copy).

### What we do

**3:00 — Your two projects, and which one you would drop (35 min).** Each of you
takes about four minutes: both projects, then which you would abandon and why.
**The argument is the exercise**, not the polish. You will hear eight other
people reason through the same problem, which is the part you cannot get from
feedback on your own work alone.

You leave with one project. Class 4 is the pitch.

**3:35 — Paperpile and the JHU library (15 min).** Connecting the Hopkins proxy,
which is how PDFs arrive rather than just titles. We also walk one finished JEP
issue into the course library so you can see where your homework lands.

**3:50 — Litmaps (20 min).** The tool your literature review runs on, and the
thing your class-4 pitch is built from. Read
[**what a Litmap is and why**](litmaps.md) before you come — it is one page, and
it means we can spend the twenty minutes building one rather than explaining the
idea.

**4:10 — Break (10 min).**

**4:20 — Getting Python working on your own machine (70 min).** A terminal,
`git`, Miniconda, the course environment, and JupyterLab. We do it together, from
the written guides, and nobody leaves until this prints:

```
python -c "import pandas, numpy, matplotlib, statsmodels; print('all good')"
```

This is the hour that used to be unnecessary because the course ran on a remote
server. It no longer does, which means the environment lives on your laptop and
is yours — it keeps working after this course ends, which the server never did.

Two things worth knowing in advance so they do not alarm you: **building the
environment takes five to fifteen minutes and prints a wall of text**, which is
normal; and **`myst build --pdf` does not work yet** — a missing LaTeX engine,
already on our list, nothing to do with anything you did.

### <a id="class03-assignment"></a>Homework, due before Class 4 — and Class 4 is your pitch

**Read this part properly, because the next class is assessed.** Class 4 is
*Research Pitches*: you give a short pitch on the topic you chose, and part of it
is **sharing your screen to show your Litmap** as evidence that you know what has
already been written about your question.

So the homework below is not preparation for a discussion. It is the material you
will stand up and present.

- [ ] **A Litmap for your chosen topic** — at least one literature search, built
      out from a seed paper that connects directly to your question. If you have
      not read [what a Litmap is and why](litmaps.md), start there; it explains
      the tool and what a good map looks like.
- [ ] **Be ready to argue for your selections.** Why these papers and not others;
      which you think are the most important, and why. This is the substance of
      the class-4 pitch.
- [ ] If Paperpile is still awkward, the
      [Paperpile Help Center](https://paperpile.com/help/) is the one page that
      leads to everything — getting started, the browser extension, the library
      proxy, folders and sharing.

One thing on the literature. A map with a lot of nodes is not evidence you know the field, and Litmaps will not surface everything. Follow citations out of the papers it does give you, check Google Scholar and the JHU econ library guide, and read enough to say why a paper matters and why you left others out. 

## Class 4: Research Pitches

**This class is assessed.** You give a pitch of **no more than five minutes** on
the topic you chose in class 3, and part of it is sharing your screen to show
your Litmap as evidence that you know the existing literature. What that means in
practice is at the bottom of this section — read it before you build your slides,
not after.

What to have ready: your **Litmap** for the chosen topic (see
[what a Litmap is and why](litmaps.md)), and a clear statement of your **research
question**.


1. **CC, TA** Create a Jupyter Notebook (20 min)
   - Create a new Notebook that contains your Litmaps and any associated text.
   - Push to course Github in your contrib folder.
  
2. **CC, TA** Use AI to improve Jupyter Notebook (20 min)
   - Research any methods for this that do not involve copy and pasting into ChatGPT.
  

3. **CC, TA** Pitch (70 min)
   - You will share a pitch, no longer than 5 minutes in duration, that should convey the following items:

- Exhibit understanding of existing literature around your topics 
    - You will share your screen showing LitMaps results.
- Clear research question 
    - Do you understand the topic you selected?
    - Were you able to articulate it as a research question?
- Preview/outline of what you plan to do to answer that question.
- Fit & finish
    - Visual aides should be clear, concise, and not too wordy.
    - Speaking style should be slow and understandable.

**Additional Guidelines**
- 5 minutes per student + 5 min Q&A (×7 students = 70 min)

<a id="class04-assignment"></a>**Homework**
- Continue to upload your Litmaps and upload into PaperPile account. 
- Pick some of your papers from your Litmap and read them. 
- Write a summary paragraph for each paper. 
  - This will help with the Literature Review down the line.
  - Use AI to refine your summary paragraph, and to help the paragraphs include cross-references to other papers.
- Refine the ideas presented in your pitch. 
- We are looking for deeper knowledge of literature and refined ideas.
- Also, find some information about your data options and include a pitch on what type of data you plan to use. 
- Make an update to your fork and then make a pull request to the main course repo. 
  - This is how will turn in assignments from now on. 
