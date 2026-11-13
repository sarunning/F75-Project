reports/report.html: reports/report.Rmd output/tables/sumtable.rds output/figures/boxplot_hiv_days.rds
	Rscript -e "rmarkdown::render('reports/report.Rmd')"

output/tables/sumtable.rds: code/01_make_sumtable.R data/raw/f75_interim.csv
	Rscript code/01_make_sumtable.R
	
output/figures/boxplot_hiv_days.rds: code/02_hivresults_daysstable.R data/raw/f75_interim.csv
	Rscript code/02_hivresults_daysstable.R