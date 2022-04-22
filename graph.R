###################################
# GRAPHICATION
###################################

COL_CLASS1  <- "magenta"
COL_CLASS2  <- "red"
COL_CLASS3  <- "orange"


library(ggplot2)

#Graph 1: Classification Training
g2 <- ggplot(data=training) + 
  geom_point(aes(x=Comp.1,y=Comp.2,col=prediction_training),shape=19) + 
  theme_bw() + 
  ggtitle('Training Set') +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_color_manual(name="Species",values=c(COL_CLASS1,COL_CLASS2,COL_CLASS3)) +
  xlim(c(min(Xproy$Comp.1),max(Xproy$Comp.1))) +
  ylim(c(min(Xproy$Comp.2),max(Xproy$Comp.2))) +
  geom_text(x=0,y=2.5,label=paste0("Accuracy ",trainAcc,"%")) +
  geom_text(x=0,y=2.0,label=paste0(nrow(training)," Samples"))


#Graph 2: Classification Test
sp_test <- rep(18,length(tp_test))
sp_test[!tp_test] <- 4
g3 <- ggplot(data=test) + 
  geom_point(aes(x=Comp.1,y=Comp.2,col=prediction_test),shape=sp_test,size=2) + 
  theme_bw() + 
  ggtitle('Test Set') +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_color_manual(name="Predicted Class",values=c(COL_CLASS1,COL_CLASS2,COL_CLASS3)) +
  xlim(c(min(Xproy$Comp.1),max(Xproy$Comp.1))) +
  ylim(c(min(Xproy$Comp.2),max(Xproy$Comp.2))) +
  geom_text(x=0,y=2.5,label=paste0("Accuracy ",testAcc,"%")) +
  geom_text(x=0,y=2.0,label=paste0(nrow(test)," Samples"))

