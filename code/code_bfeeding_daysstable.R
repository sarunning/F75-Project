here::i_am("code/code_bfeeding_daysstable.R")

df <- read.csv("data/raw/f75_interim.csv")

library(ggplot2)

df$days_stable <- as.numeric(df$days_stable)

# Remove individuals who died (days_stable = 999) and the 1 child missing bfeeding
df_alive <- subset(df, days_stable < 999 & !is.na(bfeeding))

# Boxplot of days to stabilization by breastfeeding status among survivors
boxplot_bfeeding <- ggplot(data = df_alive, aes(x = bfeeding, y = days_stable, fill = bfeeding)) +
  geom_boxplot() +
  labs(
    x = "Still Breastfeeding",
    y = "Days to Stabilization",
    title = "Days to Stabilization by Breastfeeding Status Among Survivors"
  )

saveRDS(boxplot_bfeeding,
        here::here("output/figures/boxplot_bfeeding_days.rds"))

ggsave(
  here::here("output/figures/boxplot_bfeeding_days.png"),
  plot = boxplot_bfeeding,
  width = 7, 
  height = 5, 
  dpi = 300
)