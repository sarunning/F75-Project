here::i_am("code/code_arms_daysstable.R")

df <- read.csv("data/raw/f75_interim.csv")

library(ggplot2)

df$days_stable <- as.numeric(df$days_stable)

# Remove individuals who died (days_stable = 999)
df_alive <- subset(df, days_stable < 999)
  
# Boxplot of days to stabilization by treatment arm among survivors
boxplot <- ggplot(data = df_alive, aes(x = arm, y = days_stable, fill = arm)) +
  geom_boxplot() +
  labs(
    x = "Treatment Arm",
    y = "Days to Stabilization",
    title = "Days to Stabilization by Treatment Arm Among Survivors"
  )

saveRDS(boxplot, file = here::here("output/figures/boxplot_arm_days.rds"))
