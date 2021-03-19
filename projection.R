###################################
# PRINCIPAL COMPONENT ANALYSIS
# Reduce dimensionality
###################################

#Loading IRIS dataset
library(datasets)
data(iris)

#Number of components
NCOMP <- 2

#Separate variables and class
X <- iris[,1:4]
Species <- iris[,5]

#Principal component analysis
ir.pca <- princomp(X,cor=TRUE,scores=TRUE)

#Get only first NCOMP components
Xproy <- data.frame(ir.pca$scores[,1:NCOMP],Species)
colnames(Xproy) <- c(paste0("Comp.",1:NCOMP),"Species")

