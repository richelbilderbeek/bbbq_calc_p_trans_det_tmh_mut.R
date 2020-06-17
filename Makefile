# Usage:
#
# * On local:
#
#   make
#
# * On Peregrine:
# 
#   make
#
#   (do this by 'sbatch make.sh)
#

all:
	Rscript start_jobs.R

zip:
	zip bbbq_p_trans.zip *.csv *.png *.log *.R Makefile *.sh

clean:
	rm -f *.png *.pdf *.log *.png *.csv

