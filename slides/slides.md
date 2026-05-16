---
marp: true
theme: default
paginate: true
transition: fade
style: |
  /* ============================================================
     PYCON THEME — tune accent colors here.
     These five vars drive every accent in the deck. Tweak freely;
     contrast them against the purple/pink cityscape background.
     ============================================================ */
  :root {
    --fg:        #ececf5;   /* primary body text on dark bg */
    --fg-muted:  #b8b3d4;   /* secondary text, comments, subtitles */
    --accent-1:  #ffd5ec;   /* h1 — near-white pink, ~6.5:1 contrast on template purple */
    --accent-2:  #d5f3ff;   /* h2 — near-white cyan, high contrast on vivid purple */
    --accent-3:  #ddc4ff;   /* h3, emphasis — light lavender */
    --code-bg:   #0d0820;   /* fully opaque dark — gives muted syntax colors proper contrast */
    --panel-bg:  #0d0820f2; /* card/table cell background — darker, near-opaque for readability */
  }

  /* --- Base typography + global cityscape background --- */
  section {
    font-family: 'Avenir Next', 'SF Pro Text', -apple-system, system-ui, sans-serif;
    font-size: 26px;
    color: var(--fg);
    padding: 28px 56px 40px;
    background-image: url('pycon-template-3.png');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  }
  section > h1:first-child,
  section > h2:first-child { margin-top: 0; }
  section.lead {
    text-align: center;
    font-size: 32px;
    background-image: url('pycon-template-1.png');   /* full cityscape for the opening title */
  }
  /* Reuse `.lead` centering but swap to the minimal template for the closing slide. */
  section.lead.thank-you {
    background-image: url('pycon-template-3.png');
  }
  section.lead h1 {
    font-size: 60px;
    color: var(--accent-1);
    border-bottom: none;
  }
  section.lead h2 {
    font-size: 32px;
    color: var(--fg-muted);
    font-weight: 300;
  }
  h1 {
    color: var(--accent-1);
    font-size: 42px;
    border-bottom: 2px solid #ff9ec766;
    padding-bottom: 8px;
  }
  h2 { color: var(--accent-2); font-size: 30px; }
  h3 { color: var(--accent-3); font-size: 24px; }

  /* --- Inline code --- */
  code {
    font-family: 'JetBrains Mono', 'Fira Code', 'SF Mono', monospace;
    background: var(--code-bg);
    color: #ffb86c;              /* orange accent for inline */
    padding: 2px 6px;
    border-radius: 4px;
    font-size: 0.92em;
  }

  /* --- Code blocks --- */
  pre {
    background: var(--code-bg) !important;
    border: 1px solid #ffffff22;
    border-radius: 8px;
    padding: 10px 14px !important;
    font-size: 20px;
    line-height: 1.35;
    backdrop-filter: blur(2px);
  }
  section.dense pre { font-size: 17px; line-height: 1.3; padding: 8px 12px !important; }
  pre code {
    background: transparent;
    color: var(--fg);
    padding: 0;
    font-size: inherit;
  }

  /* --- Line numbers (gutter rendered via CSS counters) --- */
  pre > code { counter-reset: line; }
  pre > code .line {
    counter-increment: line;
    display: block;
  }
  pre > code .line::before {
    content: counter(line);
    display: inline-block;
    width: 2.5ch;
    margin-right: 1em;
    text-align: right;
    color: #6b6892;            /* muted purple-gray — present but recedes */
    border-right: 1px solid #ffffff14;
    padding-right: 0.6em;
    user-select: none;
  }
  section.dense pre > code .line::before { width: 2ch; margin-right: 0.7em; padding-right: 0.4em; }
  /* Opt-out per slide with `<!-- _class: nolines -->` */
  section.nolines pre > code .line::before { content: none; border-right: none; padding-right: 0; margin-right: 0; }

  /* --- Syntax highlighting (3-color muted palette) ---
     Only 3 token classes carry color: structure (keywords + decorators),
     strings, and f-string interpolations. Everything else inherits --fg
     so the eye lands on what matters: control flow and string holes.    */
  .hljs-keyword,
  .hljs-built_in,
  .hljs-type,
  .hljs-meta,
  .hljs-decorator { color: #c5a3ff; }                    /* purple: structure — def, import, @decorator */
  .hljs-string,
  .hljs-meta-string { color: #8ab48d; }                  /* muted green: strings */
  .hljs-subst,
  .hljs-template-variable,
  .hljs-template-tag { color: #ffe066; }                 /* yellow: f-string {…} interpolations */
  .hljs-comment,
  .hljs-quote { color: #8a86a8; font-style: italic; }    /* muted purple-gray: comments */
  /* Values — literals (True/False/None) and numbers. Single color so they read
     as one semantic group ("constant values you might tweak"). */
  pre > code .hljs-literal,
  pre > code .hljs-number { color: #7dd3fc; }            /* cyan: values */

  /* Function/method names — soft accent so def/call sites stand out from args. */
  pre > code .hljs-title,
  pre > code .hljs-title.function_,
  pre > code .hljs-function .hljs-title { color: #ffb86c; } /* soft orange: function names */

  /* Reset remaining tokens that Marp's GFM stylesheet otherwise colors
     to GitHub defaults — they should read as body text. */
  pre > code .hljs-params,
  pre > code .hljs-variable,
  pre > code .hljs-attr,
  pre > code .hljs-property,
  pre > code .hljs-symbol,
  pre > code .hljs-bullet,
  pre > code .hljs-section,
  pre > code .hljs-operator,
  pre > code .hljs-selector-attr,
  pre > code .hljs-selector-class,
  pre > code .hljs-selector-id { color: var(--fg); }

  /* Diff highlighting — semantic, kept distinct */
  .hljs-deletion { color: #ff9ec7; background: #4a1a2a; }
  .hljs-addition { color: #8ab48d; background: #1a3a1a; }

  /* --- Links, emphasis, blockquote --- */
  a { color: var(--accent-2); }
  strong { color: #a5e3a1; }
  /* In headings, bold should stay the heading color, not flip to green — otherwise the
     green/purple complementary clash muddies the bold portion of the line. */
  h1 strong, h2 strong, h3 strong { color: inherit; }
  em { color: var(--accent-3); font-style: normal; }
  blockquote {
    border-left: 4px solid var(--accent-1);
    padding-left: 16px;
    color: var(--fg-muted);
    font-style: italic;
  }

  /* --- Tables --- */
  table { font-size: 22px; color: var(--fg); border-collapse: collapse; }
  th {
    background: #1a0f3df2;                /* slightly lighter than cells for header contrast */
    color: var(--accent-1);
    border: 1px solid #ffffff1a;
  }
  td {
    background: var(--panel-bg);
    border: 1px solid #ffffff14;
  }
  section.centered-table table { margin-left: auto; margin-right: auto; }

  /* --- Section dividers --- */
  section.section-divider {
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
    background-image: url('pycon-template-2.png');   /* hero bg with sun + cityscape for chapter breaks */
  }
  section.section-divider h1 {
    font-size: 54px;
    border-bottom: none;
    color: var(--accent-1);
  }
  section.section-divider h2 {
    color: var(--fg);                 /* full-strength light text instead of muted */
    font-weight: 600;                 /* semi-bold — readable at projection distance */
    letter-spacing: 0.03em;           /* subtle tracking keeps it from feeling chunky */
  }

  /* --- Helper classes --- */
  .pattern-box {
    background: var(--panel-bg);
    border: 1px solid #ff9ec744;
    border-radius: 8px;
    padding: 12px 16px;
    margin: 8px 0;
  }
  .columns {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 24px;
  }
  .qr-row {
    display: flex;
    justify-content: center;
    gap: 72px;
    margin-top: 12px;
  }
  .qr-row > div { text-align: center; }
  .qr-row img { display: block; margin: 0 auto 10px; }
---

<!-- _class: lead -->

# Building Professional CLIs in Python

**Avik Basu**
Staff Data Scientist
Intuit

<!-- speaker notes:
Welcome! Today we're going to take a CLI from basic print statements
to an interactive terminal dashboard — and along the way, pick up
patterns that make any CLI tool professional-grade.
-->

---

# About Me

<br>

- Based in Sunnyvale, CA
- Staff Data Scientist at Intuit
- Editor at PyOpenSci
- Love RPG!
- Driving is therapy! 🕹️

---

# Agenda

<br>

1. **Why CLIs?** - Motivation
2. **Argparse** — Baseline functionality
3. **Typer** — Function signatures as CLIs
4. **Rich** — Output that communicates
5. **Textual** — Interactive TUIs
6. **Production patterns** — How to scale things up!

<!-- speaker notes:
Four library stages in the order you'd naturally adopt them, plus the
cross-cutting production patterns slide set. The first three sections
motivate each other; the Textual section is optional if your tool doesn't
need interactivity. Total: ~25 minutes + Q&A.
-->

---

# My first CLI experience

<br>

- Year **2013**
- Just installed **Ubuntu**
- First **Python project**
- Learning **Git** as a CLI

---

# My first CLI experience

<br>

- Year **2013**
- Just Installed **Ubuntu**
- First **Python project**
- Learning **Git** as a CLI

![bg right 100% contrast](git-status-2.png)

---

## I typed `git commit`...

...and suddenly I was **here**

![bg right:70% 100% contrast](_)

<!-- speaker notes:
- A full-screen editor I had never seen
- No menus
- No "save" button
- No "exit" button
- Just a blinking cursor
-->

<!-- speaker notes:
This is the vi editor. Ubuntu's default. git opens it when you don't
pass -m for your commit message. I had no idea what I was looking at.
-->

---

## I typed `git commit`...

...and suddenly I was **here**

<!-- speaker notes:
- A full-screen editor I had never seen
- No menus
- No "save" button
- No "exit" button
- Just a blinking cursor
-->

![bg right:70% 100% contrast](git-commit.png)

<!-- speaker notes:
This is the vi editor. Ubuntu's default. git opens it when you don't
pass -m for your commit message. I had no idea what I was looking at.
-->

---

## OK, I wrote a message...

...now **how do I save and exit?**

<!-- speaker notes:
- `Ctrl-S`? Nothing happened.
- `Ctrl-C`? It killed the whole thing — message lost.
- Esc? Just beeped at me.
-->

![bg right:70% 90% contrast](git-commit-2.png)

<!-- speaker notes:
I figured out insert mode eventually, typed "first commit wohoooo!",
then hit the wall again trying to actually save and exit.
-->

<!--

## This isn't vi's/vim's fault.

<br>

It's a beautifully designed tool.

The problem was **me** — a beginner dropped into a powerful tool with
no path from _"what is this?"_ to _"oh, I get it."_

**That's the gap great CLIs close: a gentle on-ramp for newcomers,
without compromising power for experts.**

-->

---

# Why great CLIs matter

<br>

- **Fast**
- **Composable**
- **Scriptable**
- **Universal**
- **Agent-contract**

<!-- speaker notes:
ML teams live in terminals — training, deploying, debugging.
If the terminal experience is bad, people build a web UI instead.
And now there's a new consumer: AI agents like Claude Code and
Gemini CLI invoke CLI tools, read --help, parse output.
The patterns we'll cover today serve both audiences.

"A good CLI is an API for humans — and increasingly, for machines."
-->

---

# Our Running Example

<br>

## A tool to **monitor ML model explainability**

- Capture explanations as the model runs in production
- Understand which features drive the predictions
- Compare explanations across different model versions or time windows

---

# Three Commands

<br>

| Command  | What it does                                        |
| -------- | --------------------------------------------------- |
| `log`    | Log explanation values for a batch of predictions   |
| `report` | Generate summary and drift reports (2 sub-commands) |
| `watch`  | Live monitoring dashboard                           |

<br>

No ML background needed. Just think of it as:

**log data → analyze data → watch data live**

<!-- speaker notes:
The domain doesn't matter for what we're learning today.
These three commands naturally motivate all the patterns we'll cover.
-->

---

# What we want from our CLI

<br>

1. **Distributable in a venv and globally**
2. **Support Subcommands**
3. **Type-safe inputs**
4. **Config hierarchy**
5. **Progress feedback**
6. **Fast**
7. **Good defaults**

---

# Make it a command

<br>

```toml
[project.scripts]
shapmonitor = "shapmonitor.cli:app"
```

<br>

- `pip install` puts `shapmonitor` on `$PATH`.
- For local hacking: `python -m shapmonitor` works too if there is a `__main__.py` setup

---

<!-- _class: section-divider -->

# Argparse

**Imperative Style**

---

<!-- _class: dense -->

# The log command, with argparse

```python
# shapmonitor/__main__.py
import argparse, os, sys

def main():
    parser = argparse.ArgumentParser(
        prog="shapmonitor",
        description="Log SHAP values for a batch of predictions.",
    )
    parser.add_argument("data", help="Path to CSV file with feature data")
    parser.add_argument("--model", required=True, help="Path to model file")
    parser.add_argument("--data-dir", default="./shap_logs")
    # more args...

    args = parser.parse_args()

    if not os.path.exists(args.data):
        print(f"Error: data file not found: {args.data}", file=sys.stderr)
        sys.exit(1)
    # same for model
    if not 0.0 <= args.sample_rate <= 1.0:
        print("Error: --sample-rate must be between 0.0 and 1.0", file=sys.stderr)
        sys.exit(1)
    # ... and *now* we can read the CSV and compute SHAP values
```

**~20 lines of plumbing before we touch the data.**

---

## Help command - built-in

<br>

```bash
$ shapmonitor log --help
```

<br>

```
usage: shapmonitor log [-h] --model MODEL
[--data-dir DATA_DIR] [--sample-rate SAMPLE_RATE]
[--model-version MODEL_VERSION] data

positional arguments:
  data                  Path to CSV file with feature data

options:
  -h, --help            show this help message and exit
  --model MODEL         Path to pickled model
  --data-dir DATA_DIR   Output directory
  --sample-rate SAMPLE_RATE
                        Sampling rate (0.0-1.0)
  --model-version MODEL_VERSION
                        Model version tag
```

---

# The `log` command

<br>

```bash
$ shapmonitor log demo/batch_current.csv --model demo/model.pkl --data-dir ./logs
```

<br>

```bash
Logged 100 samples to ./logs
```

<br>

It writes the explanation (SHAP) values to disk.

---

# The `report summary` command

<br>

```bash
$ shapmonitor report summary --data-dir ./logs
```

```
Feature               Mean |SHAP|       Mean        Std
------------------------------------------------------
age                        0.1159     0.0106     0.1298
recent_inquiries           0.1053    -0.0134     0.1165
employment_years           0.0806     0.0136     0.1001
credit_score               0.0563    -0.0075     0.0673
payment_history            0.0476    -0.0178     0.0612
debt_ratio                 0.0340    -0.0187     0.0427
income                     0.0120    -0.0003     0.0183
num_accounts               0.0054    -0.0001     0.0088
```

<br>

It works but, **we can do better**.

---

# The pain points

<br>

1. **Verbose argument definitions**
2. **Manual validation**
3. **No Config hierarchy**
4. **Text-only output**

---

<!-- _class: section-divider -->

# Typer

**Core Idea: The Function Signature _is_ the CLI**

<br>

# Rich

**Enhanced Output and Formatting**

---

```python
# shapmonitor/cli/log.py
from pathlib import Path
from typing import Annotated
import typer

def log_command(
    data: Annotated[Path, typer.Argument(exists=True, readable=True)],
    model: Annotated[Path, typer.Option("--model", "-m",
        exists=True, readable=True)],
    data_dir: Annotated[Path, typer.Option(
        envvar="SHAPMONITOR_DATA_DIR")] = Path("./shap_logs"),
    sample_rate: Annotated[float, typer.Option(min=0.0, max=1.0)] = 1.0,
) -> None:
    """Log SHAP values for a batch of predictions."""
    ...
```

<br>

**Type hints** become **CLI arguments**. Validation is **Declarative.**

 <!--

# Side by side

<div class="columns">
<div>

### Argparse

```python
parser.add_argument(
    "data",
    type=str,
    help="Path to CSV"
)
# Then manually:
# - check file exists
# - convert to Path
# - validate readable
```

</div>
<div>

### Typer

```python
data: Annotated[
    Path,
    typer.Argument(
        help="Input CSV file.",
        exists=True,
        readable=True,
    )
]
# Done. ✓
```

</div>
</div>

**Same thing, but Typer validates the path exists, is readable, and gives a helpful error if not.**
-->

---

# Subcommands and composition

```python
# shapmonitor/cli/report.py — a nested Typer group
report_app = typer.Typer(no_args_is_help=True)

@report_app.command("summary")
def summary_command(...): ...

@report_app.command("drift")
def drift_command(...): ...

# shapmonitor/cli/__init__.py — mount the group under "report"
app.add_typer(report_app, name="report")
```

<br>

```bash
-> shapmonitor report summary --top-k 5
-> shapmonitor report drift --ref last-14d..last-7d
```

---

# Some Good Typer Defaults

<br>

```python
# shapmonitor/cli/__init__.py
app = typer.Typer(
    name="shapmonitor",
    no_args_is_help=True,     # no args? show help, don't error
    help="Monitor SHAP explanations over time.",
    rich_markup_mode="rich",  # styled help output
)
```

- **`no_args_is_help=True`** — bare `shapmonitor` prints help, not a usage error
- **`rich_markup_mode="rich"`** — colored, boxed help output from the docstring

---

<!--
![bg fit](shapmonitor-help.png)

---
-->

<!-- _class: section-divider -->

# Enhanced Output

## Rich

---

# Makes life better in a terminal

<br>

Rich provides:

- **Progress bars** — feedback for long-running tasks
- **Tables** — structured data that's easy to scan
- **Panels** — grouped information with borders
- **Styled text** — emphasis, color-coded severity
- **Tracebacks** — readable, syntax-highlighted errors

---

# Status Indicators

```python
# shapmonitor/cli/log.py
from rich.progress import Progress, SpinnerColumn, TextColumn

with Progress(
    SpinnerColumn(),
    TextColumn("[progress.description]{task.description}"),
    console=console,
    transient=True,  # disappears when done
) as progress:
    progress.add_task("Computing SHAP values...", total=None)
    monitor.log_batch(X)
```

<!-- speaker notes:
A column is a Rich renderable — a small object that knows how to draw one cell of the progress line, refreshed on
  every tick.

Rich gives you a kit of columns; mix the ones
  that match your work" is the right level
-->

```
⠋ Computing SHAP values...
```

- **Transient spinners** for indeterminate work.
- **Progress bars** when you know the total.

---

# Tables with visual weight

```python
# shapmonitor/cli/report.py — summary_command
from rich.table import Table

table = Table(title=f"SHAP Summary  ({p.start} → {p.end})")
table.add_column("Feature", style="bold")
table.add_column("Mean |SHAP|", justify="right")
table.add_column("", justify="left")       # inline bar
table.add_column("Mean", justify="right")
table.add_column("Std", justify="right")

for feat, row in summary_df.iterrows():
    bar_len = int(20 * row["mean_abs"] / max_mean_abs)
    bar = "[cyan]" + "\u2588" * bar_len + "[/cyan]"
    table.add_row(str(feat), f"{row['mean_abs']:.4f}", bar,
                  f"{row['mean']:.4f}", f"{row['std']:.4f}")

console.print(table)
```

---

![bg fit](report-summary.png)

---

# Styled status and panels

<br>

```python
# shapmonitor/cli/report.py — drift_command
from rich.panel import Panel

alerts = int((drift_df["psi"] >= 0.25).sum())
warnings = int(((drift_df["psi"] >= 0.1) & (drift_df["psi"] < 0.25)).sum())
stable = int((drift_df["psi"] < 0.1).sum())

headline = " · ".join([
    f"[red]{alerts} alert{'s' if alerts != 1 else ''}[/red]",
    f"[yellow]{warnings} warning{'s' if warnings != 1 else ''}[/yellow]",
    f"[green]{stable} stable[/green]",
])

console.print(Panel(headline, title="Drift Report", border_style="blue"))
```

---

![bg fit](report-drift.png)

---

<!-- _class: section-divider -->

# Interactive TUI

## Textual

---

# When static output isn't enough

<br>

Some tasks need **interactivity**:

- **Live monitoring** — data that updates in real time
- **Exploration** — filter, sort, navigate large datasets
- **Keyboard-driven workflows** — no mouse, no re-running

**Textual** gives you a full application framework in the terminal:
widgets, layouts, events, CSS styling, keybindings.

---

# App structure

```python
# shapmonitor/cli/_watch_app.py
from textual.app import App, ComposeResult
from textual.widgets import DataTable, Footer, Header, Input

class WatchApp(App):
    TITLE = "shapmonitor watch"
    CSS = """
    #filter-input { dock: top; margin: 0 1; height: 3; }
    DataTable { height: 1fr; }
    """
    def compose(self) -> ComposeResult:
        yield Header(show_clock=True)
        yield Input(placeholder="Type to filter features...", id="filter-input")
        yield DataTable(id="shap-table")
        yield Footer()
```

- **`compose()` defines the layout.**
- **CSS controls sizing.**

---

# Live data with auto-refresh

```python
def on_mount(self) -> None:
    table = self.query_one(DataTable)
    table.add_columns("Feature", "Mean |SHAP|", "Std", "PSI", "Status")

    self._load_data()  # initial load
    self.set_interval(self._refresh_interval, self._load_data)

def _load_data(self) -> None:
    analyzer = SHAPAnalyzer(get_backend(self._data_dir))
    period = parse_period(self._period_spec)
    self._summary = analyzer.summary(period.start, period.end)
    self._refresh_table()
```

The table rebuilds with fresh data every 5 seconds.

<!--

# Interactive filtering

```python
from textual.binding import Binding

BINDINGS = [
    Binding("q", "quit", "Quit"),
    Binding("r", "refresh", "Refresh"),
    Binding("/", "focus_filter", "Filter"),
    Binding("escape", "clear_filter", "Clear filter"),
]

def on_input_changed(self, event: Input.Changed) -> None:
    self._filter_text = event.value.lower()
    self._refresh_table()

def _refresh_table(self) -> None:
    table = self.query_one(DataTable)
    table.clear()
    for feature, row in self._summary.iterrows():
        if self._filter_text not in str(feature).lower():
            continue
        table.add_row(str(feature), ...)
```

-->

---

<!-- _class: section-divider -->

# Production Patterns

---

# Composability — pipeable output

A great CLI plays well with `jq`, `xargs`, **and** humans at the same time.

```python
if json_mode:
    typer.echo(json.dumps(data, default=str))
    return
render_rich_table(data)
```

```bash
$ shapmonitor report summary --json | jq '.features[:1]'
```

```bash
[
  {
    "feature": "recent_inquiries",
    "mean_abs": 0.11099565029144287,
    "mean": 0.02865222841501236,
    "std": 0.11797577887773514,
    "min": -0.2615908980369568,
    "max": 0.23528572916984558
  },
]
```

---

# Imports are EXPENSIVE for a CLI application

```python
# shapmonitor/__init__.py
import logging
from shapmonitor.monitor import SHAPMonitor

logging.getLogger(__name__).addHandler(logging.NullHandler())

__all__ = ["SHAPMonitor"]

# 1. `import shapmonitor`
# 2. `from shapmonitor import shapmonitor`
# Both of them basically take the same time.
```

The cost: every `import` of the package pays for a lot of dependencies; even when the caller never touches the main module.

For a CLI, that means even `shapmonitor --help` can become slow.

<!-- speaker notes:
The mental model: imports aren't declarative ("foo is now available"); they're imperative ("execute foo's module body"). Each import is a side effect — it runs code, allocates memory, registers handlers.

For libraries that depend on heavy ML stacks (shap, numba, sklearn), this compounds. shapmonitor's eager version takes 430ms just to import — before any function runs. CLIs are the worst victims of this because --help should be instant.

Set up the next slide: "There's a Python feature that lets the library defer this — PEP 562."
-->

---

# Lazy Import Strategies

<br>

- Use local imports, e.g. inside a function
- Use the lazy-loader library
- Use TYPE_CHECKING for expensive type hints
- Wait for Python 3.15 (PEP 810)

---

# Lazy module attributes (Thanks to: PEP 562 🙏🏼)

<br>

```python
# shapmonitor/__init__.py
__all__ = ["SHAPMonitor"]

def __getattr__(name):
    if name == "SHAPMonitor":
        from shapmonitor.monitor import SHAPMonitor
        return SHAPMonitor
    raise AttributeError(f"module {__name__!r} has no attribute {name!r}")
```

<br>

- `import shapmonitor` → loads only the module shell
- `from shapmonitor import SHAPMonitor` → triggers the dependency loading **only on first access**

<!-- speaker notes:
PEP 562 was added in Python 3.7 (2018) but most developers don't know it exists. It lets you define a module-level __getattr__ that intercepts attribute access on the module itself.

Two ways to think about it: (1) lazy property for modules, (2) the import system's equivalent of __getattr__ on a class.

The trick is the `from shapmonitor.monitor import SHAPMonitor` happens INSIDE __getattr__, so it only fires the first time someone accesses shapmonitor.SHAPMonitor. After that, Python caches the attribute on the module — so subsequent accesses are free.

Add it to any package's __init__.py. Costs zero for callers that don't access the heavy attributes (e.g., --help). Costs the same as before for callers that do.
-->

<!--

# Optional CLI dependencies

<br>

The underlying library can have optional CLI dependencies

```toml
# pyproject.toml
[project.scripts]
shapmonitor = "shapmonitor.cli:app"   # ← puts `shapmonitor` on $PATH

[project.optional-dependencies]
cli = [
    "typer>=0.12,<1.0",
    "rich>=13.0,<15.0",
    "textual>=1.0,<9.0; python_version < '4'",
]
```

**`pip install shap-monitor` → just the library**
**`pip install shap-monitor[cli]` → library + `shapmonitor` command on `$PATH`**
-->

---

# Distribution

<br>

Not everyone is a python developer or a python user! 🙂
<br>

```bash
pip install shap-monitor              # library users
```

```bash
pipx install "shap-monitor[cli]"      # CLI users installed globally
```

```bash
uvx install "shap-monitor[cli]"       # CLI users installed globally
```

```bash
brew install shap-monitor             # if needed
```

<!-- speaker notes:
Three audiences, three install commands.

pip — for Python projects that import shap-monitor as a dependency.
Lives in your project's venv alongside other deps.

pipx — for Python users who just want the command. Each CLI tool
lives in its own isolated venv with the binary on $PATH. If you've
ever installed httpie or black globally with pip and broken your
Python env, pipx is the fix.

brew — for users who don't want to know about Python. Looks like a
native macOS or Linux tool.
-->

---

# Config hierarchy

<br>

**Flags → env vars → defaults** - the precedence users expect.

```python
data_dir: Annotated[
    Path,
    typer.Option(
        envvar="SHAPMONITOR_DATA_DIR",   # ← falls back to env var
    ),
] = Path("./shap_logs")                 # ← falls back to default
```

```bash
# All three work, in priority order:
$ shapmonitor log data.csv --data-dir /custom/path
$ SHAPMONITOR_DATA_DIR=/custom/path shapmonitor log data.csv
$ shapmonitor log data.csv  # uses ./shap_logs
```

<br>

**One line gives us 3 config layers.**

---

# Where should your CLI's files live?

A proper CLI can have **three categories** of files:

- **Config** — settings the user edits
- **Data** — persistent state your tool writes
- **Cache** — regeneratable files

<br>

The **XDG Base Directory Spec** — Linux's standard home for each:

| Kind   | Env var            | Default          |
| ------ | ------------------ | ---------------- |
| config | `$XDG_CONFIG_HOME` | `~/.config`      |
| data   | `$XDG_DATA_HOME`   | `~/.local/share` |
| cache  | `$XDG_CACHE_HOME`  | `~/.cache`       |

<br>

<small>Spec: [specifications.freedesktop.org/basedir/latest](https://specifications.freedesktop.org/basedir/latest/)</small>

<!-- speaker notes:
Most "amateur" CLIs do one of two things wrong:
  1. cwd-relative paths (./logs, ./config.toml) — fragile, move with the shell.
  2. Hardcoded ~/.toolname/ — clutters home, ignores OS conventions.
The XDG spec fixes both: each kind of file has a well-known home, users can
override via env vars, and you get predictable categorization for free.
-->

---

# Cross-platform with `platformdirs`

<br>

```python
from platformdirs import user_config_dir, user_data_dir, user_cache_dir

config_dir = Path(user_config_dir("your_app"))
data_dir   = Path(user_data_dir("your_app"))
cache_dir  = Path(user_cache_dir("your_app"))

# Linux:   ~/.config/yourapp, ~/.local/share/yourapp, ~/.cache/yourapp
# macOS:   ~/Library/Preferences/yourapp, ~/Library/Application Support/yourapp, ...
# Windows: %APPDATA%\yourapp, %LOCALAPPDATA%\yourapp, ...
```

<br>

Notable CLIs using this: `black`, `poetry`, `tox`.

<!-- speaker notes:
On Linux platformdirs respects $XDG_* env vars automatically, so users still
get the override behavior the spec promises.
-->

---

<!-- _class: centered-table -->

# When to reach for what

<br>

| You need...                 | Use...        | Complexity |
| --------------------------- | ------------- | ---------- |
| Plain single script         | **Argparse**  | Low        |
| Just argument parsing       | **Typer**     | Low        |
| Readable, structured output | + **Rich**    | Low        |
| Progress bars, spinners     | + **Rich**    | Low        |
| Live data, interactivity    | + **Textual** | Medium     |
| Full TUI application        | + **Textual** | Higher     |

<br>

<!-- speaker notes:

We don't have to use all three
Each layer is independent. Adoption can be incremental.
-->

---

# References

<br>

### Typer &nbsp; — &nbsp; CLIs from type hints

Docs: [typer.tiangolo.com](https://typer.tiangolo.com) &nbsp;·&nbsp; Source: [github.com/tiangolo/typer](https://github.com/tiangolo/typer)

<br>

### Rich &nbsp; — &nbsp; Beautiful terminal output

Docs: [rich.readthedocs.io](https://rich.readthedocs.io) &nbsp;·&nbsp; Source: [github.com/Textualize/rich](https://github.com/Textualize/rich)

<br>

### Textual &nbsp; — &nbsp; Full TUI application framework

Docs: [textual.textualize.io](https://textual.textualize.io) &nbsp;·&nbsp; Source: [github.com/Textualize/textual](https://github.com/Textualize/textual)

<!-- speaker notes:
One sentence each as you walk through. Don't dwell — audience just needs the
pointer. Mention that Rich and Textual are both by the Textualize team, so
adopting Rich is a natural on-ramp to Textual when interactivity is needed.
-->

---

![bg](tlou2-theater.png)

---

<!-- _class: lead thank-you -->

# Thank you! 🙏

## Questions?

<div class="qr-row">
<div><img src="qr-linkedin.png" width="190"><br><strong>LinkedIn</strong></div>
<div><img src="qr-slides.png" width="190"><br><strong>Slides</strong></div>
<div><img src="qr-tool.png" width="190"><br><strong>shap-monitor</strong></div>
</div>

<!-- speaker notes:
Open Q&A here. If asked about shap-monitor, frame it as "a project where
I use all three libraries together — a real-world example of today's patterns."
-->
