# bbbq_p_trans

Branch   |[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.org)                                                                             
---------|------------------------------------------------------------------------------------------------------------------------------------------
`master` |[![Build Status](https://travis-ci.org/richelbilderbeek/bbbq_p_trans.svg?branch=master)](https://travis-ci.org/richelbilderbeek/bbbq_p_trans) 
`develop`|[![Build Status](https://travis-ci.org/richelbilderbeek/bbbq_p_trans.svg?branch=develop)](https://travis-ci.org/richelbilderbeek/bbbq_p_trans)

BBBQ: the chance that a transition happens

## Goal
 
 * Determine percentage of transitions
 * On Peregrine and local

## Usage

```
sbatch make.sh
```

## Create data

 * Creates random peptides: 
    * [x] script: `create_peptides.R`
    * [x] `peptides.csv`, column names: `peptide`, `is_tmh`



