here::i_am("code/02_hivresults_daysstable.R")

data <- read.csv(
  file = here::here("data/raw/f75_interim.csv")
)

install.packages("ggplot2")
library(ggplot2)

data$days_stable <- as.numeric(data$days_stable)

# Remove individuals who died (days_stable = 999)
data_alive <- subset(data, days_stable < 999 )

# Boxplot of days to stabilization by HIV results among survivors

boxplot_hiv <- ggplot(data_alive, aes(x = hiv_results, y = days_stable)) +
  geom_boxplot() +
  labs(
    x = "HIV Result",
    y = "Days to Stabilization",
    title = "Days to Stabilization by HIV Results Among Survivors"
  ) +
  theme_minimal()

saveRDS(boxplot_hiv, file = here::here("output/figures/boxplot_hiv_days.rds"))
