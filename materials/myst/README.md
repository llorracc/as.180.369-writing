# Writing your paper in MyST

Your paper is written in **MyST**, plain-text Markdown with a few extra marks for
citations, cross-references, figures and equations. The `myst` program turns the
folder into a web page, and with LaTeX into a PDF. This page covers everything
the paper needs. The full manual is at [mystmd.org/guide](https://mystmd.org/guide).

Every example here was checked on 2026-10-09 with mystmd 1.10.1, the version in
the course environment, on a copy of the paper template.

**Models to copy from:**
- a former TA's finished course paper (not included in this copy);
- Alan Lujan's *The Sequential Endogenous Grid Method*, a research paper written
  in MyST: [the paper](https://alujan.dev/sequential_egm/) and
  [its source](https://github.com/alanlujan91/sequential_egm).

## Where your paper is, and how it is put together

Your paper is `contrib/<your-handle>/paper/`. It lives on your
`<your-handle>/paper` branch for the whole term (see `contrib/README.md`).

| file | what it does |
|---|---|
| `myst.yml` | the settings: your name, the title, the bibliography file, the PDF format. Edit your name (three places) and the title (two places) first. |
| `00_paper_root.md` | the order of the paper: one `{include}` per section file. Its first lines keep tables in place in the PDF; leave them. |
| `01_abstract.md` … `05_conclusion.md` | the sections, in Markdown |
| `04_dataanalysis.ipynb` | your analysis; its figures appear in the paper |
| `references.bib` | your bibliography, exported from Paperpile as BibTeX |
| `07_appendix.ipynb` | the appendix. The reference list needs no file: MyST adds it after the last section. |

To add, drop or reorder a section, edit `00_paper_root.md`. A file that is not
included there is not in the paper.

The abstract is marked as the abstract by the `+++ {"part": "abstract"}` line
above it and the `+++` below it. Leave both lines in place.

## See it as you write

```bash
conda activate as369
cd contrib/<your-handle>/paper
myst start
```

Open the `http://localhost:…` link it prints. The page updates each time you save
a file. Ctrl-C stops it. The first run downloads the page's theme, which takes
about a minute. Ignore any "Update available" banner.

Read what `myst start` prints. A line starting with ⚠️ names the file and the
problem, usually a citation key or label that does not match anything.

## Citations

A citation key is the text between `@article{` and the first comma of its entry
in `references.bib`.

| you write | you get |
|---|---|
| ``{cite:t}`Fama1970` argues…`` | Fama (1970) argues… |
| ``…reflect information {cite:p}`Fama1970`.`` | …reflect information (Fama, 1970). |
| ``{cite:p}`Fama1970; Shiller1981` `` | (Fama, 1970; Shiller, 1981) |
| `[@Shiller1981]` | (Shiller, 1981), a shorter way to write a parenthetical one |

Every paper you cite is listed under **References** at the end automatically.
Papers in `references.bib` that you never cite are left out.

## Cross-references: never type a number

Give the thing a label, then refer to the label. MyST numbers everything and
keeps the numbers right when you move things around.

| to label… | write | refer with | you get |
|---|---|---|---|
| a section | `(sec-data)=` on the line above its `#` heading | `[](#sec-data)` | the section's title |
| an equation | `(eq-returns)` after the closing `$$`, as below | `[](#eq-returns)` | (1) |
| a figure | `:label: fig-returns` in the figure, as below | `[](#fig-returns)` | Figure 1 |
| a table | `:label: tbl-summary` in the table, as below | `[](#tbl-summary)` | Table 1 |

So write `[](#fig-returns) shows…`, not `Figure [](#fig-returns) shows…`, which
gives "Figure Figure 1". A label is lowercase letters, digits and hyphens, and is
used once in the whole paper.

## Math

Inline: `$\beta < 1$`. A numbered equation on its own line:

```
$$
r_t = \log P_t - \log P_{t-1}
$$ (eq-returns)
```

## Figures from your notebook

Make the figure in `04_dataanalysis.ipynb`, and show it in the paper without the
code that made it. Two steps.

**1. In the code cell that draws the figure**, put these two lines at the very
top:

```python
#| label: cell-returns
#| tags: [remove-cell]
import matplotlib.pyplot as plt
fig, ax = plt.subplots()
ax.plot(years, returns)
ax.set_title("Annual stock returns")
fig
```

The `label` names the cell's output, and `remove-cell` keeps the code out of the
paper. End the cell with the figure (`fig`) so the figure is its output.

**2. Where the figure should appear**, in a Markdown cell of the notebook or in
any section file, write:

```
:::{figure} #cell-returns
:label: fig-returns
Annual stock returns, 1950–2024.
:::
```

The first line points at the cell. `:label:` is what you refer to with
`[](#fig-returns)`. The line after it is the caption.

**The paper shows what the notebook last saved.** MyST does not run the notebook.
After changing the analysis, run **Kernel → Restart Kernel and Run All Cells**,
save, and then look at the paper.

## Tables

A small table written by hand:

````
```{list-table} Summary statistics
:label: tbl-summary
:header-rows: 1
* - Variable
  - Mean
* - Annual return
  - 0.07
```
````

The text after `{list-table}` is the caption, and `:header-rows: 1` makes the
first row the header.

## Before you push

1. In `04_dataanalysis.ipynb`, **Restart Kernel and Run All Cells**, then save.
2. Run `myst start`. Check the paper reads right and the output shows no ⚠️ lines.
3. Commit on your `<your-handle>/paper` branch and push. It goes into your
   paper's pull request.

## The PDF

The PDF is typeset by LaTeX, which you install once: step 8 of the setup guide
([Mac](../setup/macos-local-setup.md), [Windows](../setup/windows-local-setup.md)),
whose check ends with `PASS`. Then, in your paper folder:

```bash
myst build --pdf
```

writes `paper.pdf` there, through the LaTeX template `arxiv_nips`.
`./reproduce.sh` reruns your notebook first, then does the same, and tells you
plainly whether the PDF was made.

Open the PDF before you hand it in: the title, your name, numbered sections,
figures, and the references at the end. `myst build --pdf` can finish without
complaint and still have printed lines marked with a red sign (⛔️); read them.
If MyST says an update is available, ignore it: the course environment sets
MyST's version.
