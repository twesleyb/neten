#!/usr/bin/env Rscript

# Installation with devtools
devtools::install_github("twesleyb/neten")

# Installation with renv
renv::install("twesleyb/neten")


# butterfly example

library(neten)

data(butterfly)

ne_butterfly <- neten(butterfly)
