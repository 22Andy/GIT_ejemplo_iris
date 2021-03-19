###################################
# CLASSIFICATION
###################################

library(class)


#Proportion of training data
PTRAIN <- 0.8

# Set random seed to make results reproducible:
set.seed(17)

# Calculate the size of each of the data sets:
data_set_size <- floor(PTRAIN*nrow(Xproy))

# Generate a random sample of "data_set_size" indexes
indexes <- sample(1:nrow(Xproy), size = data_set_size)

# Assign the data to the correct sets
training <- Xproy[indexes,-ncol(Xproy)]
test <- Xproy[-indexes,-ncol(Xproy)]

# Get observed clases for training and test sets
observed_training    <- Xproy[indexes,ncol(Xproy)]
observed_test        <- Xproy[-indexes,ncol(Xproy)]

# KNN
prediction_training <- knn(training,training,cl=observed_training,k=PAR)
prediction_test     <- knn(training,test,cl=observed_training,k=PAR)

#Calculate true positives
tp_train <- observed_training==prediction_training
tp_test  <- observed_test==prediction_test

#Calculate accuracy for training and test set
trainAcc <- round(100*sum(tp_train)/nrow(training),2)
testAcc  <- round(100*sum(tp_test)/nrow(test),2)


