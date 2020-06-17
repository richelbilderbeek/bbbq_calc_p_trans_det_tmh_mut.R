#!/bin/bash
# Bash script to run make with sbatch
#
# Usage:
#
#   sbatch make.sh
#
#SBATCH --time=240:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=20G
#SBATCH --job-name=bbbq_p_tmh
#SBATCH --output=bbbq_p_tmh.log
module load R Python/3.8.2-GCCcore-9.3.0

make


