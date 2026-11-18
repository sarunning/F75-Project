------------------------------------------------------------------------

editor_options: markdown: wrap: 72 ---

# F75 Formula Project

## Project Overview

This project analyzes the F75 formula dataset using R. The project is organized s that the analysis can be reproduced using the provided R scripts and Makefile. Running the Makefile executes the necessary steps and generates the report.

## Team Members

- Madelyn Hill
- Sydney Kuhn
- Hannah Lawinger
- Sarah Running

## Repository Structure

- `code/`: R scripts used to process and analyze the data and generate tables and figures.

- `data/raw/`: Original input dataset.

- `data/processed/`: Processed datasets, if applicable.

- `output/figures/`: Generated figures and saved figure objects.

- `output/tables/`: Generated tables and saved table objects.

- `reports/`: R Markdown report containing the complete project analysis and the rendered HTML report.

- `renv/`: Project-specific R package library and environment information.

## Data

The analysis uses the F75 formula dataset, stored in data/raw/

Data source: <https://pubmed.ncbi.nlm.nih.gov/30807589/>

The raw data are used by the analysis scripts to generate the outputs included in the final report

## Requirements

- R
- RStudio
- R M
- renv
- Make

R package dependencies are managed using `renv`.

To install the required R packages, open the project in RStudio and run:

```         
renv::restore()
```

This restores the package environment specified in the project's `renv.lock` file

## Building the Report

To reproduce the analysis and generate the report:

1.  Clone or download the repository.

2.  Open the project in RStudio.

3.  Restore the required R packages using `renv::restore()`.

4.  Open a terminal in the project’s root directory.

5.  Run:

```         
make
```

The Makefile runs the necessary analysis scripts and renders the final report.

## Outputs

The project generates:

- An HTML report containing the complete analysis.

- Figures saved in `output/figures/`.

- Tables saved in `output/tables/`.

The final rendered report is saved as `reports/report.html`.
