# “The Setup”

## Overview

In the initial setup phase of this course, we will get you set-up to use the core tools
involved in writing a research paper in economics or other quantitative disciplines.

## Class 1

In this class, we will complete initial setup for all of the tools and services we will use.

Students will work with their instructor, TA, and external support to sign up
for each service. **Step-by-step instructions, and what each one costs, are in
[Services_signups.md](Services_signups.md) — read that first.**

**Setting up your own Mac:**
[macos-local-setup.md](macos-local-setup.md). Terminal, `git`, Miniconda, the
course Python environment, JupyterLab and LaTeX, in eight steps, written for
someone who has never opened a terminal. About an hour. We go through it together
in class — do not worry if you have not done it beforehand.

**Setting up your own Windows PC:**
[windows-local-setup.md](windows-local-setup.md). **On Windows, WSL (the Ubuntu
Linux that runs inside Windows) is required**, and that page sets it up first.
Plain Windows is not supported: the course's install scripts need one consistent
Unix environment, and it is not feasible to support every variant of every
operating system. Some of the tools, MyST among them, work under WSL and not on
plain Windows. If WSL cannot be installed on your laptop, talk to the TA.

**A git cheatsheet to keep by you:**
a git cheatsheet (not included in this copy).
Cameron Riddell wrote it for this course. It walks the whole loop — `git status`,
`git add`, `git commit`, `git push` — in nine screenshotted steps, and its FAQ
answers the two things that strand people first: how to escape the editor when
you forget `-m` on a commit, and why changes made on GitHub do not appear on your
own machine until you pull.

You do **not** need it yet. Everything in class 1 happens in the browser and
needs no command line. Read it when we reach the command line, or sooner if you
are curious. Two warnings when you do: its screenshots are of a remote server we
no longer use rather than your own laptop, and it predates the
fork-and-pull-request workflow you are using — so treat the four commands as the
lesson and the surrounding scenery as historical. `git status`, `git add`,
`git commit` and `git push` work identically wherever you run them.

- [ ] sign up for [Github](https://github.com) — free
      ([details](Services_signups.md#github))
- [ ] sign up for [OpenAI ChatGPT](https://openai.com/) — free, and the Codex
      agent you use from class 2 is included in the free plan
      ([details](Services_signups.md#chatgpt-and-codex))
- [ ] sign up for [Paperpile](https://paperpile.com) — **30-day free trial, then
      about $50 for the year**. Four steps, in order, and all four matter:
      **(1)** do it in **Google Chrome**, not Safari or Firefox;
      **(2)** sign in with your **personal Gmail account** — the library stays
      with that account, so use the one you keep after graduating;
      **(3)** start the **30-day free trial**;
      **(4)** install the **Paperpile Chrome extension** and check the icon
      appears in your toolbar. Without the extension the one-click "save this
      paper" button does not exist, and that is the whole point of the tool.
      **Which plan to buy, when the trial ends, and why it is not Expert:**
      [Services_signups.md#paperpile](Services_signups.md#paperpile).
- [ ] sign up for [Litmaps](https://www.litmaps.com) — free tier is enough
      ([details](Services_signups.md#litmaps))

**What the course costs you, all in one place:**
[Services_signups.md](Services_signups.md#what-this-course-actually-costs-you).
Short version: one charge of about $50 for Paperpile, and nothing else.

Students will also complete their first reading for this course and conduct their first discussion with the instructor.
- [ ] read Dennett, D. C. (2023, May 16). *The problem with counterfeit people.*
      The Atlantic. **The copy to read is in this folder —
      The_Problem_With_Counterfeit_People.pdf (not included in this copy)**
      — so you do not have to fight the paywall. The original is
      [here](https://www.theatlantic.com/technology/archive/2023/05/problem-counterfeit-people/674075/)
      if you have Atlantic access.

- [ ] draft a summary of the Dennett paper, using ChatGPT to make deliberate, targetted improvements

### Everything you need for the assignment is in this folder

The Dennett summary is the assignment set in this class and due in the next one.
These are the four things you need to do it, all here in `materials/setup/`:

| | |
|---|---|
| **The reading** | The_Problem_With_Counterfeit_People.pdf (not included in this copy) — no paywall |
| **What to write, and how it is marked** | the file already waiting in your own directory: `contrib/<your-handle>/assignments/class01-dennett-summary.md`. It carries the word count, the commit requirement, and the hand-in steps |
| **How to work with the AI** | [*Working with the AI — what "improvement" means here*](#working-with-the-ai--what-improvement-means-here), below on this page. This is the technique the grade actually rewards, and it was demonstrated live in class 1 |
| **Which accounts you need** | [Services_signups.md](Services_signups.md), with what each one costs |

Two more, for when you want them rather than for the assignment itself:
[macos-local-setup.md](macos-local-setup.md) to get everything running on your
own Mac, and
a git cheatsheet (not included in this copy)
for the four git commands.

**If you only read one thing:** open your own
`contrib/<your-handle>/assignments/class01-dennett-summary.md`. The assignment is
written inside it.

### Agenda

- **CC, TA's**: Introductions (5 min.)
  Instructor, coinstructor, technical support will share their backgrounds in academic research and how they will support students in this course.
- **CC**: Course Overview (15 min.)
  Instructor will walk through the syllabus and share the overarching vision for this course, as well as the specific goals he has for attendees.
- **CC**: Tools Introduction (10 min.)
  Instructor will give an introduction to each of the tools that will be used in this course, their purpose, and how they fit into the process of writing and submitting a research paper for publication.
- **CC, TA's***: Service Signups (30 min.)
  Students will sign up for the services above, with direction and guidance from instructor, coïnstructor, and technical support.
  - [ ] Create a Github account.
  - [ ] Accept the invitation to the class repository (check your email, or
        <https://github.com/notifications>).
  - [ ] **Fork** the class repository into your own account.
- Independent Reading (15 min.)
  Students will read the Dennett paper.
- *Short Break (5 min.)*
- **CC, TA's***: Independent Writing with Instructor-Led ChatGPT Demonstration (55 min.)
  - [ ] Students will write a brief (250 words) summary of the Dennett paper —
        this is the **in-class starting draft**, not the submission. The piece you
        hand in is 500–1000 words and is described under *Assignments* below.
    - [ ] The writing goes in your own directory under `contrib/` — see below.
  - [ ] Instructor will demonstrate how to use ChatGPT to make guided improvements to writing.

### <a id="class01-assignment"></a>Assignments


Everything below happens **in the browser**. You do not need to install
anything, and you do not need the command line — we have not covered it yet.

- [ ] **Write your summary in your fork.**
  - You forked the class repository in class 1, so you already have your own
    copy at `https://github.com/<your-github-handle>/as.180.369`. All of your
    work happens there, not in the class copy.
  - Your directory came with the fork: `contrib/<your-github-handle>/`. **Do
    not make a second one.** If it is genuinely not there, you joined after the
    first class — say so and I will create it.
  - The file to write is
    `contrib/<your-github-handle>/assignments/class01-dennett-summary.md`. It
    already exists, with the instructions and the marking criteria in it.
    Replace them with your own writing.
  - To edit it: open the file in your fork, press the **pencil** icon, write,
    then scroll down and press **Commit changes**. That is the whole loop.
  - **Commit as you go — at least five times, over at least three days, at
    least an hour apart.** The history is part of the mark, so commit rough and
    let the drafts show. See *Working with the AI* below for what the
    improvement between commits should look like.

- [ ] **Hand it in by opening a pull request — early, and only once.**
  - **A pull request is how you turn work in.** Open it **as soon as your first
    rough draft is committed**, not when you have finished.
  - **It then updates itself.** A pull request is a live view of your file, not a
    snapshot of the day you opened it. Every later commit appears in it
    automatically — you do not resubmit, and you never open a second one. When I
    merge it, it takes the latest version you committed.
  - The click-by-click steps, including which way round the base and head fields
    must read, are in the assignment file itself under *"Where it goes, and how to
    hand it in"*.

- [ ] **Make `contrib/<your-github-handle>/README.md` about you.** It doubles
      as your first markdown exercise; the file lists what to demonstrate.

See `contrib/README.md` (not included in this copy) for the naming rules.

### Working with the AI — what "improvement" means here

This was demonstrated live in class 1. If you were not there, this is what you
missed, and it is the part the grade actually rewards.

The point is **not** to ask an AI to write the piece. It is to use it as a
demanding reader. Two things make the difference:

1. **Make a specific request, saying exactly what you want.** "Make this better"
   produces bland rewriting. Ask for a particular kind of scrutiny.
2. **Ask for criticism anchored to your text**, not general advice. The prompt
   demonstrated in class was:

   > *"Please provide a list of specific critiques with references to specific
   > places in the text that I gave you."*

   Then decide, yourself, which critiques you accept. Rejecting a suggestion for
   a reason is as good as taking it — better, if the reason is good.

Commit after each round. What is being marked is the difference between your
drafts: what you asked, what came back, and what you chose to do about it. A
piece that arrives polished in one commit shows none of that, which is why the
history counts as much as the final text.

**Say what happened in each commit's message:** what you asked the AI, which
critiques you took, and which you rejected and why. In the browser, the
**Commit changes** box has room for it under *Extended description*.

- [ ] **Completed Dennett summary — due _in class_ on Monday 14 September.**
  - Due *in* class rather than before it, because we go through the pull requests
    together in the room and sort the mechanics out once, properly. **From the
    next assignment on, work is due before class.**
  - The assignment, the marking criteria and the hand-in steps are all in the file
    itself: `contrib/<your-github-handle>/assignments/class01-dennett-summary.md`.
    In short: 500–1000 words, a summary plus one or two thoughts of your own,
    worked on with ChatGPT or Claude, in **at least five commits, on at least
    three different days, no two within an hour of each other** — and the
    improvement between those commits is what the grade rewards.
