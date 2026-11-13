here::i_am("code/01_make_sumtable.R")

data <- read.csv(
  file = here::here("data/raw/f75_interim.csv")
)

install.packages("gtsummary")
install.packages("dplyr")
library(dplyr)
library(gtsummary)

sumtable <- data |> 
  select("agemons", "sex", "height", "weight", "muac") |>
  tbl_summary(
    statistic = list(
      agemons ~ "{median} ({p25}, {p75})",
      sex ~ "{n} ({p}%)",
      height ~ "{mean} ({sd})",
      weight ~ "{mean} ({sd})",
      muac ~ "{mean} ({sd})"
    ),
    label = list(
     agemons ~ "Age (months)" ,
     sex ~ "Sex",
     height ~ "Height (cm)",
     weight ~ "Weight (kg)",
     muac ~ "Mid-upper arm circumference (cm)"
    ),
    digits = list(
      agemons ~ 1,
      height ~ 1,
      weight ~ 1,
      muac ~ 1
    )
  )

saveRDS(
  sumtable,
  file = here::here("output/tables/sumtable.rds")
)

