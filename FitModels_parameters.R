yr  = 1
rep = 1

#Data Filepaths
phen.file        <- paste("../../../../../../Data.Preparation/Yr", yr, "/rep", rep, "/output/Y.csv", sep = "") #path to phentoypic file
G.file           <- paste("../../../../../../G/Yr", 1, "/output/EVD.G.rda", sep = "")
GxE.file         <- paste("../../../../../../GxE/Yr", yr, "/output/EVD.GxE.rda", sep = "")

#Assign Columns
idCol.y <- 1
envCol  <- 3
yCol    <- 5
cvCol   <- 7

Model.type = "G"
folds = 5

iters   = 12000
burnins = 2000
