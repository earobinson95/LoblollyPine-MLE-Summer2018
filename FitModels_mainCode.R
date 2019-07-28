library(BGLR)
rm(list = ls())

setwd("../output")
source("../input/parameters.R")
setwd("../output")

Y <- read.csv(phen.file)
load(G.file)
load(GxE.file)

Y$yhat <- NA
for(j in 1:folds){
    test.index <- Y[,cvCol] == j
    y    <- Y[,yCol]
    y.na <- y
    y.na[test.index] <- NA
    
    if(Model.type == 'G'){
        ETA <- list(1)
        ETA[[1]] <- list(V = EVD.G$vectors, d = EVD.G$values, model = 'RKHS')
    }
    if(Model.type == 'GxE'){
      ETA <- list(2)
      ETA[[1]] <- list(V = EVD.G$vectors,   d = EVD.G$values,   model = "RKHS")
      ETA[[2]] <- list(V = EVD.GxE$vectors, d = EVD.GxE$values, model = "RKHS")
    }
    
    mod <- BGLR(y = y.na, ETA = ETA, nIter = iters, burnIn = burnins)
    mod$y0 <- y
    save(mod, file = paste('fold', j, "/mod.rda", sep = ""))
    Y$yhat[test.index] <- mod$yHat[test.index]
}
Yhats <- Y
write.csv(Yhats, file = "preds.csv", row.names = F)

