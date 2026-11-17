all: reports/report.html reports/report_SK.html

output/figures/boxplot_bfeeding_days.rds output/figures/boxplot_bfeeding_days.png: code/code_bfeeding_daysstable.R data/raw/f75_interim.csv
	Rscript code/code_bfeeding_daysstable.R

reports/report_SK.html: reports/report_SK.Rmd output/figures/boxplot_bfeeding_days.rds
	Rscript -e "rmarkdown::render('reports/report_SK.Rmd')"

reports/report.html: reports/report.Rmd output/tables/sumtable.rds output/figures/boxplot_hiv_days.rds output/figures/boxplot_arm_days.rds
	Rscript -e "rmarkdown::render('reports/report.Rmd')"

output/tables/sumtable.rds: code/01_make_sumtable.R data/raw/f75_interim.csv
	Rscript code/01_make_sumtable.R

output/figures/boxplot_hiv_days.rds: code/02_hivresults_daysstable.R data/raw/f75_interim.csv
	Rscript code/02_hivresults_daysstable.R

output/figures/boxplot_arm_days.rds: code/code_arms_daysstable.R data/raw/f75_interim.csv
	Rscript code/code_arms_daysstable.R

.PHONY: clean
clean:
	rm -f output/figures/*.rds output/figures/*.png reports/*.html