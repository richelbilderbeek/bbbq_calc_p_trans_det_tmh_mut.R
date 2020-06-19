library(ggplot2)
library(testthat)

filenames <- list.files("results", pattern = "*.csv", full.names = TRUE)

n_files <- length(filenames)

t <- tibble::tibble(
  protein_sequence = rep(NA, n_files),
  mhc_haplotype = NA,
  percentile = NA,
  p = NA
)
for (i in seq_len(n_files)) {
  u <- readr::read_csv(filenames[i])
  t$protein_sequence[i] <- u$protein_sequence
  t$mhc_haplotype[i] <- u$mhc_haplotype
  t$percentile[i] <- u$percentile
  p <- u$p
  if (p == 0.0) t$p[i] <- 0.0
  else if (p == 1.0) t$p[i] <- 0.0
  else if (p < 0.5) t$p[i] <- p
  else if (p > 0.5) t$p[i] <- 1.0 - p
}


readr::write_csv(t, "p_trans_p_0_02.csv")
p_trans <- mean(t$p)
min(t$p)
mean(t$p)
max(t$p)

library(dplyr)

readr::write_csv(
  t %>% group_by(mhc_haplotype) %>% summarise(max(p)),
  "p_trans_p_0_02_max.csv"
)

n_peptides <- length(unique(t$protein_sequence))
percentile <- t$percentile

ggplot2::ggplot(t, aes(x = mhc_haplotype, y = p)) +
  geom_boxplot() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(
    caption = glue::glue(
      "Number of peptides: {n_peptides}, percentile: {percentile}, average: {p_trans}"
    )
  ) + ggsave("p_trans_0_02.png", width = 7, height = 7)
