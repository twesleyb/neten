#!/usr/bin/env Rscript

# Installation.
devtools::install_github("twesleyb/neten")

# Load the package.
library(neten)

# Example data, before and after NE.
data(butterfly)
data(butterflyNE) # output from Matlab::Network_Enhancement

# Perform NE.
dmNE <- Network_Enhancement(butterfly)

dmNE == butterflyNE

