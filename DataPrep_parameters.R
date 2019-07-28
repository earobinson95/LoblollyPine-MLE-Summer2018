mm.file          <- "../../../../SNP.Preparation/output/X.csv" #path to marker file
phen.file        <- "../../../../Root.Data/Y.genotyped.csv" #path to phentoypic file
id.x.file        <- "../../../../SNP.Preparation/output/IDx.csv"

yr               <- 1
rep              <- 1

#Assign Columns
idCol.y <- 4
envCol  <- 2
yrCol   <- 3
yCol    <- 5

#Cross validation indicator
folds <- 5
cv0 <- TRUE
cv1 <- TRUE
cv2 <- TRUE
