# “The Presentation”

## Overview

## Class 12

**[Homework from previous class](../../materials/submission)**

**Agenda**
- Discussion of individual presentations (5-10 min ea).
- Present your final (LitMap)
- Tips & tricks for slideshow presenting.
- Discuss reproducibility.
    - Results need to be generated within your notebook
        - (or as a consequence of executing your notebook).
    - Single script should reproduce all outputs: `reproduce.sh`
    - "It works on my computer!" → reproducibility with binder.
        - There different version of python
        - different versions of packages we use (pandas, etc.)
        - mybinder is a tool that we can specify the specific versions of these
          things and generate a link that some one can click on and open a
          notebook with these things installed.
    - Create a file of YOUR environment:
        - In your paper directory
        - Create a folder: binder 
            ```
            mkdir binder
            cd binder
            ```
        - create the environment file: This will create a file with all installed packages
            ```
            conda env export --from-history -f environment.yml
            ```
        - get the specified versions:
          ```
            conda list | grep -E -i -w "^$(conda env export --no-builds --from-history | awk '$1 == "-"{ if (key == "dependencies:") print $NF; next } {key=$1}' | sed 's/=.*//' | tr -s '\r\n' '|' | sed 's/|$//')\s" | awk '{ print $1 "=" $2 }' | sed 's/^/  - /'
          ```
        - replace the packages with the list on your terminal 
    - Create a reproduce.sh file:
        - copy and paste the file from a former TA's worked example (not included in this copy)
        - Replace jupyter notebook names with the file names of your paper
        - give the script permission to be executable using your terminal
          - ```ls -las``` (shows if it is executable)
          - ```chmod u+x reproduce.sh ```
          - ```ls -las```(reproduce.sh file should be green now)
        - run the file using
            ```/bin/bash reproduce.sh```
        - NOTE: I build the paper using myst and save it as a pdf. To specify options here, adjust your myst.yml (not included in this copy) file
    - Sync your GitHub fork to assure that binder can access all information
 
- Run another students reproduce.sh file on your computer (these will be assigned by the TA) to make sure they are working. Troubleshoot as we go along. 



# <a id="class12-assignment"></a>Homework
- Work on Presentations: Don't just make them a paraphrased version of your paper! (feel free to see the template linked here
- # Final Paper deadline moved to Friday December 18 - this is the last day of finals 
  - Make sure to increase the number of papers you're citing to ~15 or more
  - Be sure to run your final paper through ChatGPT/AI multiple times before submitting

## Class 13 — your presentation

The last class. Everyone presents.

**Agenda**
- **Fifteen minutes each**: 10 presenting, 5 for questions. Nine of you, so that
  is 135 minutes of a 150-minute class — the whole session, with almost no
  slack. The timing will be held to, visibly. That is not strictness for its own
  sake: a conference slot does not stretch because you are not finished, and this
  is the rehearsal for that.
- **The order is posted beforehand**, so you are not spending someone else's
  presentation wondering when you are on.
- **Visuals that carry the argument** rather than decorate it. The one figure
  that makes your point is worth more than three that look busy.
- **Say what your evidence cannot support.** Naming a limitation is not a
  weakness in a presentation; it is the part that makes everything else
  credible.

**Before you present, have your work in more than one place.** Committed and
pushed to your fork is two; a local copy is three. Nothing about the last week of
term is improved by a laptop dying with the only copy of a paper on it.

*(Your Python environment was set up in class 3 — Miniconda, and WSL for Windows
users. There is nothing new to install for this class.)*
