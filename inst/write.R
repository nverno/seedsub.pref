#!/usr/bin/env Rscript

library(devtools)
pkgs <- c("seedsub", "seedsub.mas")
lapply(pkgs,
       function(x)
           if (!(x %in% row.names(installed.packages())))
               install_github(paste0("nverno/", x)))

library(seedsub)
library(seedsub.mas)

## Write data to .csv
dir.create("data")

for (pkg in pkgs)
    lapply(data(package = pkg)$results[,"Item"],
           function(x) { write.csv(get(x), file=paste0("data/", x, ".csv")) })
