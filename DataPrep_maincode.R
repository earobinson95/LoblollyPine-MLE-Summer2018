library(dplyr)
library(groupdata2)
rm(list = ls())
setwd("../output")
source("../input/parameters.R")
setwd("../output")

Y.all <- read.csv(file = phen.file) #Read in original dataset
if(is.null(yr)){Y <- Y.all} else {Y <- Y.all %>% filter(Y.all[,yrCol] == yr)} #filter out specified year
dim(Y)

#Keep only individuals with a genotypic record
id.x  <- read.csv(id.x.file)
ID.cross <- intersect(Y[,idCol.y], id.x[,1])
length(ID.cross)
index.y <- Y[,idCol.y] %in% ID.cross
Y       <- Y[index.y,]
dim(Y)

#Cross Validation
if(cv0){
  Y$CV0    <- as.factor(as.numeric(Y[,envCol])) #All environments in same fold (aka new env)
}
if(cv1){
    Y <- fold(data = Y, k = folds, cat_col = NULL, id_col = 'Nclone') #Keep all individuals in same fold (aka new ind)
    Y$CV1 <- Y$.folds
    folds.ind <- which(colnames(Y) == '.folds')
    Y <- Y[,-folds.ind]
}
if(cv2){
    Y     <- fold(Y, k = folds, cat_col = NULL, id_col = NULL) #completely random
    Y$CV2 <- Y$.folds
    folds.ind <- which(colnames(Y) == '.folds')
    Y <- Y[,-folds.ind]
}

summary(Y)

table(Y$CV0)
table(Y$CV1)
table(Y$CV2)

Y <- Y[order(Y$Obs),] 

write.csv(Y, file = 'Y.csv', row.names = F)

quit(save='no')


