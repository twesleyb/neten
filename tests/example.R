#!/usr/bin/env Rscript

# Installation.
devtools::install_github("twesleyb/neten")

library(neten)
data(butterfly)

Network_Enhacement(butterfly)
