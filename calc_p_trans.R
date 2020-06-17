# What is the probability that a state transition takes place?
#
# States:
#  * Undetected
#  * Detected by MHC
#
# For example, if we start from a TMH that is undetected,
# what the chance it will be detected after an AA change?
#
# Algorithm:
#
# * Start from a TMH AA sequence
# * Measure the state from this sequence
# * Create all AA sequences that differ in one AA
# * Keep the ones that result in a TMH
# * Of those, count which state these are
# * Convert these counts to probabilities
library(bbbq)
library(testthat)

args <- commandArgs(trailingOnly = TRUE)

expect_equal(5, length(args))
filename <- args[1]
protein_sequence <- args[2]
mhc_haplotype <- args[3]
n_adjancent_sequences <- args[4]
percentile <- args[5]

message("filename: ", filename)
message("protein_sequence: ", protein_sequence)
message("mhc_haplotype: ", mhc_haplotype)
message("n_adjancent_sequences: ", n_adjancent_sequences)
message("percentile: ", percentile)

expect_true(is.character(filename))
expect_true(bbbq::is_peptide(protein_sequence))
expect_true(mhc_haplotype %in% bbbq::get_mhc_haplotypes())
expect_true(is.numeric(n_adjancent_sequences))
expect_true(is.numeric(percentile))


p <- bbbq::calc_p_det_tmh_mut(
  protein_sequence = protein_sequence,
  mhc_haplotype = mhc_haplotype,
  n_adjancent_sequences = n_adjancent_sequences,
  percentile = percentile
)

t <- tibble::tibble(
  protein_sequence = protein_sequence,
  mhc_haplotype = mhc_haplotype,
  n_adjancent_sequences = n_adjancent_sequences,
  percentile = percentile,
  p = p
)
readr::write_csv(t, filename)
