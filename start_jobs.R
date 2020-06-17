peptide_size <- 30
n_peptides <- 2
n_haplotypes <- 3
n_adjancent_sequences <- 4
percentile <- 0.1

mhc_haplotypes <- sample(bbbq::get_mhc_haplotypes(), size = n_haplotypes)

i <- 1
for (peptide_index in seq_len(n_peptides)) {
  protein_sequence <- bbbq::create_random_tmh(n_aas = 30)
  for (mhc_haplotype in mhc_haplotypes) {
    filename <- paste0(i, ".csv")
    cmds <- c("Rscript", "calc_p_trans.R", filename, protein_sequence, mhc_haplotype, n_adjancent_sequences, percentile)

    if (peregrine::is_on_peregrine()) {
      cmds <- c("sbatch", cmds)
    }

    system2(cmds[1], cmds[-1])
    i <- i + 1
  }
}
