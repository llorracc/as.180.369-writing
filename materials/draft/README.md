# “The Draft”

## Overview

## Class 5



### Before you come

- [ ] Hand in the [Class 4 homework](../pitch/README.md#class04-assignment) before
      class.
- [ ] Know your data. Be ready to say, in one sentence and without slides:
      *"My question is ___. The outcome I would measure is ___. I would get it
      from ___."* Everyone says theirs in the first ten minutes.
- [ ] Put the papers you are using into one Paperpile folder for your topic. You
      will export it in class.
- [ ] Check your setup still works: `conda activate as369`, then `jupyter lab`
      opens. If it does not, see [JupyterLab on your laptop](#jupyterlab-on-your-laptop).
      Bring your laptop charged.

### <a id="class05-agenda"></a>Agenda

1. **CC, TA** Your question, your outcome, your data (10 min)
   - One sentence each, as above.
2. **TA** Markdown links (15 min)
   - *Not reached in class 5. It is now part of the
     [class 6 homework](#class06-assignment), on the branch named there.*
   - How a heading becomes a link, how to copy one from GitHub, and how to turn
     the copied URL into a relative link.
   - In `contrib/<your-handle>/README.md`, add a section `## My work` with these
     five relative links:
     - your Dennett summary: `assignments/class01-dennett-summary.md`
     - your two research topics: `assignments/class02-topic.md`
     - your literature review: `paper/03_literature.md`
     - the Class 5 homework: `../../materials/draft/README.md#class05-assignment`
     - the course schedule: `../../README.md#schedule`, copied from GitHub, not
       typed
   - Use your files' real names; `ls assignments/` shows them. Work on a branch of
     its own, `<your-handle>/class05-readme-links`, started from a synced `main`.
   - Done when every link, clicked on GitHub, lands where it should.
3. **CC, TA** Get your own FRED API key, and keep it out of git (20 min)
   - Register a FRED account, then request an API key from your account page.
   - Store the key in your shell, never in a notebook:
     `echo 'export FRED_API_KEY=yourkey' >> ~/.zshrc` on a Mac, or the same into
     `~/.bashrc` in Ubuntu on Windows. Then open a new terminal and start Jupyter
     from it.
   - In code, `Fred()` with no argument reads the key from `FRED_API_KEY`.
     Test: `Fred().get_series('UNRATE').tail()`.
4. **CC** The code demo, and an audit of it (45 min)
   - Walk through [StockReturns.ipynb](../code-demo/StockReturns.ipynb):
     research question, testable hypothesis, data, plot, regression.
   - In pairs: before you believe its conclusion, check it.

*Break (10 min)*

5. **Students, TA** Build your own (35 min). *Not reached in class 5: it is now
   the [class 5 homework](#class05-assignment), due at class 6.*
   - Pick the FRED series closest to the outcome you named in item 1.
   - Start your own notebook in `contrib/<your-handle>/assignments/`: load the
     series, make one plot with labelled axes and units, write one sentence on
     what it shows.
   - Restart & Run All, commit, push your branch and open the pull request
     before you leave.
6. **TA** Wire it into your paper (15 min). *Not reached in class 5: done in
   [class 6](#class-6--making-progress).*
   - Put your name and title in `paper/myst.yml`.
   - Export your Paperpile folder as BibTeX to `paper/references.bib`.
   - Cite one paper in `paper/03_literature.md` and check it renders with
     `myst start`.

### JupyterLab on your laptop

On Windows, type all of this in **Ubuntu**, not PowerShell.

**1. Check whether you already have it.** You probably do: it is part of the
course environment you built in class 3.

```
conda activate as369
jupyter lab --version
```

- **Check:** it prints a version number, such as `4.2.5`. Go to step 3.
- `jupyter: command not found`: install it into your environment, then check
  again.

  ```
  conda install -n as369 -c conda-forge jupyterlab jupyterlab_rise
  ```

- `EnvironmentNameNotFound: Could not find conda environment: as369`: go to
  step 2.
- `conda: command not found`: Miniconda is not installed. Follow
  [the Mac guide](../setup/macos-local-setup.md) or
  [the Windows guide](../setup/windows-local-setup.md), or ask the TA.

**2. No `as369` environment yet.** This quick version takes 2–3 minutes and is
enough for class 5:

```
conda create -y -n as369 -c conda-forge python=3.11 jupyterlab jupyterlab_rise pandas matplotlib statsmodels fredapi "mystmd>=1.10.1" "nodejs=24"
conda activate as369
jupyter lab --version
myst --version
```

- **Check:** each prints a version number.
- After class, add the rest of the course environment. It takes
  5–15 minutes:

  ```
  cd ~/GitHub/as.180.369
  conda env update -n as369 -f .devcontainer/environment.yml
  ```

**3. Start it from your copy of the course repository.**

```
cd ~/GitHub/as.180.369
jupyter lab
```

- **Check:** a browser tab opens, showing the repository's folders (`contrib`,
  `materials`, …). On Windows, if no browser opens, Ctrl-click the
  `http://localhost:8888/lab?token=...` line.

**Stuck?** Ask ChatGPT, Codex or Claude:

> I'm on [Mac / Windows with WSL]. I'm trying to install and run JupyterLab in a
> conda environment called `as369`, for a course whose repository is at
> `~/GitHub/as.180.369`. I ran: [paste the command]. I got: [paste the output].
> What's wrong, and what should I run?

The check is still the same: `jupyter lab --version` prints a version number.

<a id="class05-assignment"></a>**Homework** (due before class 6, Monday 12 October)
- Build your own FRED notebook: item 5 of the agenda above, which we did not
  reach in class. Then add a second variable or a regression, and make the
  plots clear enough to read without you in the room.
- Name it `contrib/<your-handle>/assignments/class05-fred-<series>.ipynb`, with
  the series ID in lowercase (`class05-fred-unrate.ipynb`), on the branch
  `<your-handle>/class05-fred-<series>`.
- It must run top to bottom (Restart & Run All), with a sentence or two of
  conclusion. Commit it, push the branch and open a pull request.
- If your laptop will not run it, get as far as you can and write to the TA
  before Monday with the exact command and the whole error message. We check
  everyone's notebook in class 6.
- Keep reading: add a summary paragraph for each paper from your Litmap that you
  read.

## Class 6 — Making Progress



### <a id="class06-before-you-come"></a>Before you come

- [ ] **Get the course environment working on your laptop.** In a new terminal
  (on Windows, in Ubuntu):

  ```
  conda activate as369
  python -c "import fredapi, pandas, statsmodels, matplotlib; print('all good')"
  myst --version
  ```

  **Check:** it prints `all good`, then a version number. If `myst` is not
  found: `conda install -n as369 -c conda-forge "mystmd>=1.10.1" "nodejs=24"`. If anything
  else fails, follow [the Mac guide](../setup/macos-local-setup.md) or
  [the Windows guide](../setup/windows-local-setup.md) (its "fast way" has an
  AI walk you through it, with a check after each step). If you are still
  stuck, write to the TA before Monday with the exact command and the whole
  error message.
- [ ] **Check your FRED key.** If you got one in class 5:

  ```
  python -c "import os; print(len(os.environ.get('FRED_API_KEY', '')))"
  ```

  **Check:** it prints `32`. If you have no key yet, see
  [class 5, item 3](#class05-agenda) for how to get one and store it. Never put the
  key in a notebook.
- [ ] **Sync your fork:** **Sync fork** → **Update branch** on your fork's
  GitHub page, then `git switch main` and `git pull` in your clone. **If GitHub
  offers to discard commits, do not click it:** stop and write to the TA. Your
  `main` has work of its own on it, and that button deletes it.
- [ ] **Do the [class 5 homework](#class05-assignment)**: your FRED notebook,
  pushed, with its pull request open.
- [ ] **Put the papers for your topic into one Paperpile folder.** You export it
  in class.
- [ ] Bring your laptop charged.

### Agenda

We start by making sure everyone's FRED notebook runs. Then Alan Lujan joins by
Zoom, showing how he built a research paper in MyST, the system your own paper
uses. Then we go over your paper's template: what goes where, and what is
expected. You install LaTeX, which makes your paper's PDF, and wire up your own
paper the same way as Alan's (the step we did not reach in class 5). Last, we
watch a recorded lecture by Cameron Riddell, who taught this session in 2023, on
making a chart say something. His second lecture, which does that to a chart, is
homework, on yours.

1. **Your FRED notebook** (3:00–3:20), the [class 5 homework](#class05-assignment):
   - Restart & Run All, with a neighbour watching, and fix whatever fails.
   - Check its name and branch against the homework, and that its pull request
     is open.
   - If you could not build it at home, start it now: load your series, make one
     plot with labelled axes and units, write one sentence on what it shows, and
     open the pull request before Alan's talk. A plain chart is fine: the lecture
     is about what to do to it next.
   - *If a check above failed for you, you spend this time with the TA getting
     your laptop working, and Alan's talk too if need be: it is in the class
     recording, on Panopto.*
2. **Writing a paper in MyST** (Alan Lujan, by Zoom, 3:20–3:50): how a
   modern research paper is put together in MyST, using his Sequential EGM paper
   as the example.
3. **Your paper** (3:50–4:20):
   - **First, start LaTeX installing**, since it downloads for 5 to 20 minutes
     while you do the rest. Sync your fork again, as in *Before you come*: the
     course repository has new files for today. Then, in a terminal (on Windows,
     in Ubuntu):

     ```
     cd ~/GitHub/as.180.369
     bash materials/setup/install-latex.sh
     ```

     On a Mac, if it asks for your password, type your login password. Leave it
     running, and use another terminal window for the rest.
   - **Then check MyST**, in that other window:

     ```
     conda activate as369
     myst --version
     ```

     It should print a version number. If `myst` is not found, install it (a few
     minutes): `conda install -n as369 -c conda-forge "mystmd>=1.10.1" "nodejs=24"`.
   - **What goes where, and what is expected** (10 min): your paper's README,
     `contrib/<your-handle>/paper/README.md` (not included in this copy).
     From today, everything you write for the paper goes in its files.
   - In `contrib/<your-handle>/paper/myst.yml`, replace `<Your Name>` (three
     places) and `<Your paper title>` (two places).
   - Export your topic's Paperpile folder as BibTeX and save it over
     `paper/references.bib`. It should now hold entries starting with `@`, and no
     longer the example entry `SomeKey2024`.
   - In `paper/03_literature.md`, replace the example ``{cite:t}`SomeKey2024` ``
     with one sentence citing a real paper. Its key is the text between
     `@article{` and the first comma in `references.bib`.
   - With `as369` active, from your `paper/` folder run `myst start` and open the
     `localhost` link it prints. Your sentence should show *Author (Year)*, with
     the paper under **References**.
   - Commit the three files on a branch `<your-handle>/paper` and open the pull
     request. It is your paper's pull request for the whole term: later paper
     work is committed on the same branch and pushed to it.
   - **Check LaTeX** once the install says `LaTeX is installed`. Open a **new**
     terminal window:

     ```
     cd ~/GitHub/as.180.369
     conda activate as369
     bash materials/setup/check-latex.sh
     ```

     It should end `PASS`. If it ends `FAIL`, do what it says, or show it to the
     TA.
   - How to write the rest in MyST (citations, cross-references, figures from
     your notebook, equations): [Writing your paper in MyST](../myst/).

*Break (5 min)*

4. **Effective data visualization** (about an hour, with questions): who a chart
   is for and what it should say; Anscombe's quartet; how readers perceive
   position, length, colour and the other visual channels; choosing a chart type;
   colour maps (viridis rather than jet); putting the bottom line up front; chart
   junk, and Tufte's data-ink ratio. His slides:
   *Effective Data Visualization* (not included in this copy).
   **Watch it on Panopto:** *Class 6 - Cam Riddell - Effective data visualization (2023)* (recording available to enrolled students).
   Notes on his key points (not included in this copy) link each one to
   the moment in the video where he starts on it.

**Helpful notes**
- Abstract:
    - Results you hope to get. Write as if you got the results you wanted that align with your hypothesis.
    - Note why people should care about your findings.
    - Tight: Less than 200 words.
- Introduction:
    - Longer than Abstract.
    - Position the paper in terms of our current understanding/debates on the subject.
    - Motivate why you are studying this topic and why it is important. Big pictire, what is the point of your paper.
    - Aim for about a page or a page and a half (~500 to 750 words).
    - Focus on writing well. The content is less important than the process and demonstration of using the tools to improve the content you generate.


### <a id="class06-assignment"></a>Homework
- **Watch Cam's second lecture, *Applying the lessons to the stock-returns
  notebook*** (about half an hour), on Panopto (recording available to enrolled students) (JHU sign-in), with
  your FRED notebook open. Cam takes the stock-returns chart
  from class 5 and improves it one step at a time: colour and transparency, a
  title that states the finding, matplotlib's axes interface instead of
  `pyplot`, grid, labels, legend and ticks, figure size, and saving the figure.
  Pause after each step and make the same change to your own chart.
- **Then check your chart** has a title that says what it shows (not the series
  ID), axis labels with units, a source line naming the FRED series, dates that
  can be read, and one message (a second series with different units gets its
  own axis or its own chart). Restart & Run All, commit the notebook only, and
  push it to your FRED notebook's pull request.
- **If your paper does not render a citation yet**, finish item 2 of the agenda
  and push it to your `<your-handle>/paper` pull request.
- Add a section `## My work` to `contrib/<your-handle>/README.md` with relative
  links to your Dennett summary, your research topics, `paper/03_literature.md`,
  the class 5 homework (`../../materials/draft/README.md#class05-assignment`)
  and the course schedule (`../../README.md#schedule`). Do it on its own branch,
  `<your-handle>/class06-readme-links`, as its own pull request. Done when every
  link, clicked on GitHub, lands where it should.
- **Move what you have written so far for the paper into its files,** as its
  README's *What goes where* (not included in this copy)
  says: your summary paragraphs, for instance, go into `03_literature.md`. Commit on
  your `<your-handle>/paper` branch and push.
- Continue your literature review and make a start on your abstract (see the
  helpful notes above), in your paper: [Writing your paper in MyST](../myst/).
- Make a start on the introduction.


## Class 7


### Agenda
- Show us your data analysis with the FRED variables
    - Which variable did you choose and why?
    - What were the results? Were you suprised?
      
- Show us your current Introduction & **improved** Abstract!

- Discuss next steps for your paper.
    - Literature you plan to use (show latest Litmaps/paperpile).
    - What is the question that you will address with data?
    - What kind of data exist that you can use to answer your question?
      
- Working with Data in your Jupyter Notebook
    - [Instructions](pandas-basics.ipynb)
    - What is tabular data? What is a pandas DataFrame?
    - How do I select columns from a DataFrame, how do I filter rows?
    - How do I perform aggregations/compute summary statistics?
         - TA will walk through ChatGPT prompts for data analysis. Consider how this will be used for your paper. 
    - How do I perform econometrics?
    - How do I create a new `pandas` DataFrame from some other data source?
        - How read a `.csv`, how to read an excel file (`.xls`, `.xlsx`)

     

<a id="class07-assignment"></a>**Homework**
- Read the [Korinek](https://www.aeaweb.org/articles?id=10.1257/jel.20231736) paper
    - Add it to your paperpile
    - Prepare to identify the tools/ideas you would consider using from the Korinek paper.
    - In the next class, you will write a paragraph on the above.
- Obtain and explore some data that are relevant to your topic.
    - Conduct an exploration/preliminary analysis of your obtained data set(s).
- Be prepared to present to the class on your preliminary analysis of the data.
- Work on your own machine, in your clone of your fork.
    - and are `git add`ing and `git commit`ing your work regularly.
    - **Spread out commit messages over at least three days.**
- Prepare for 10 minute discussion where you are in the next class.
- **Once you're finished this, make sure to push all your work up to your GitHub fork**
  - If you find this difficult, ask AI. If you are still struggling, ask the TA.
  - Put your writing in your paper's section files, as its README's
    *What goes where* (not included in this copy) says.
    Commit it on your `<your-handle>/paper` branch and push: it goes into your paper's pull request, not a new one.
    How: [Writing your paper in MyST](../myst/).

## Class 8

### Agenda
- HW Review (70 min.)
- You should write a paragraph on the tools/ideas you would consider using from the Korinek paper. (10 min.)
- CC will run through `git merge` conflicts and how to deal with them. (15 min.)
- Make sure all copies of repo are synchronized. We will fix any merge conflicts in class. Compile your MyST Markdown on your local computer. (15 min.)
- Make a subfolder in your contrib folder. Name it "paper." You will now start saving sections of your paper to this folder. 
- Make sure that all parts of paper are in separate Jupyter notebooks or markdown files. Review a former TA's restructured paper (not included in this copy). Names should be standardized like:
```
  - abstract.md
  - introduction.md
  - literature-review.md
  - methodology.md
  - results.ipynb
  - discussion.md
  - conclusion.md
```


- Writing your jupyterbook with multiple markdowns 
  
```sh
# copy jupyterbook folder contrib/cam/jupyterbook to your own contrib folder
# navigate to the new copy of /jupyterbook your contrib folder

# start terminal session in the folder of your notebook
# alternatively, use `cd` to navigate to your notebook folder

build-jb .

# open '_build/html'
```
  
<a id="class08-assignment"></a>**Homework**
- Improve your Korinek reflection: make it >300 words, and commit improvements over 3 separate days.
  - Use AI to improve your piece!
- Revise and improve your Literature Review
  - utilize ChatGPT/Claude and commit improvements over 3 days
- Begin your data empirical work (regressions, etc.)
  - Write the first draft of your methodology section in conjunction with your regressions, etc.
- After you have completed the methodology draft, ask an AI to resolve any inconsistencies with the introduction and literature review. 
- The above 2 sections of your paper should be in *separate* markdown files.
    - For a reference, use Alan Lujan's REMARK: [the paper](https://alujan.dev/sequential_egm/) and [its source](https://github.com/alanlujan91/sequential_egm).
    - [Embed reference](https://github.com/alanlujan91/sequential_egm/blob/main/content/paper/egmn_paper_wp.md)
    - [Other reference](https://mystmd.org/guide/embed#docs-include)

## Class 9

### Agenda

- HW Review: prompts people found useful for the Korinek reflection and lit review improvements (20 minutes)

- Instructional on best practices aiding your literature search (15 minutes)
  - Beyond Litmaps & Paperpile
       - Using AI
       - [NotebookLM](https://notebooklm.google/?utm_source=chatgpt.com) - understanding papers in your literature review
       - Note: Literature review papers are particularly helpful for getting your bearings
         
- Using AI to generate ideas for data analysis (10 min)
   - [Julius AI](https://julius.ai/chat)

- Updates on your paper progress (80 minutes)
  - roadblocks and problems you've encountered
  - methodology and lit review section updates
    
- Have each student go through their local machine and make sure everything is sync'ed. (10 min)

- Review Myst files (on local machines) and fix any errors (15 min)


<a id="class09-assignment"></a>**Homework**
- Comment on a classmate's advice from the Korinek paper. 
- Write the first draft of the results section. ([Here's](https://twp.duke.edu/sites/twp.duke.edu/files/file-attachments/econ.original.pdf) a great resource from Duke on writing this and other sections.)
    - You should break your text into a number of smaller markdown cells.
        - This makes it easier to use ChatGPT for editing.
    - Be sure to get ChatGPT feedback on your writing.
    - In the commits you write, please include the prompts you used in ChatGPT.
 - Make sure that all parts of paper are in separate Jupyter notebooks. Names should be standardized like:
```
  - abstract.md
  - introduction.md
  - literature-review.md
  - methodology.md
  - results.md
  - discussion.md
  - conclusion.md
```

## Class 10


### Agenda
- Discuss your results section (10 minutes ea).
- Go over Beyond The Streetlight presentation to learn how to make presentations in HTML
  - Demonstrate jupyter-nbconvert to export jupyter rise slides using [Beyond the Streetlight](https://github.com/econ-ark/beyond-the-streetlight)
  -  important tools:
      - on top right corner click on the presentation symbol [Render the current notebook as Reveal Slideshow (Alt + R)] 
      - on the RHS of jupyter-lab go to **property inspector (two screws)** --> **common tools**
- Working with myst:
  - We will now use `myst` on your local computer. Although the usual `myst start` does not work. Instead do the following
    ```
    pip install mystmd

    myst init

    myst start
    ```
  - Open the given port link (might take a few minutes)
  - Copy Alan's paper into your contrib folder so you can use his Myst template. This is now available in the draft materials. To copy the most recent version onto your local computer:
```
     git clone depth 1 
 ```
- Explaining the difference between Myst MD and Jupyter Notebook

<a id="class10-assignment"></a>**Homework**
- Create a conclusion section
- Make a draft of the presentation of your paper.

