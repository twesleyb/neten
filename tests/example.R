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

# Check if R result is same as Matlab result.
check <- all(round(dmNE,4) == round(butterflyNE,4))

# They are the same!
