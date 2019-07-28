library(dplyr)

rm(list=ls())
setwd("../output")
source('../input/parameters.R')
setwd("../output")

Y <- read.csv(file = phen.file)

#Indice Matrix of Environments (E)............
ENV   <- as.factor(Y[,envCol])
Z.E   <- as.matrix(model.matrix(~ ENV - 1))
E     <- tcrossprod(Z.E)
EVD.E <- eigen(E)

save(E, file = 'E.rda')
save(EVD.E, file = "EVD.E.rda")

quit(save='no')


