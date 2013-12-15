mydataRead<-function(x="~/ShinyApps/run/prova.csv"){
  data1<-read.csv(x, sep=",",header=TRUE, colClasses=c(Date="character","numeric"))
  return(data1) 
}
insertRow<-function(existingDF, newrow, r){
  existingDF[seq(r+1,nrow(existingDF)+1),]<-
    existingDF[seq(r,nrow(existingDF)),]
  existingDF[r,]<-newrow
  existingDF
  write.csv(existingDF,"~/ShinyApps/run/prova.csv", ,row.names=FALSE)
}
changeRow<-function(existingDF, newrow, r){
  existingDF[r,]<-newrow
  existingDF
  write.csv(existingDF,"~/ShinyApps/run/prova.csv", ,row.names=FALSE)
}
newRow<-function(existingDF, newrow, Names){
  existingDF<-rbind(existingDF,newrow)
  names(existingDF)<-Names
  write.csv(existingDF,"~/ShinyApps/run/prova.csv",row.names=FALSE)
}
deleteLastRow<-function(existingDF){
  r<-(NROW(existingDF))
  existingDF<-existingDF[-r,]
  write.csv(existingDF,"~/ShinyApps/run/prova.csv", row.names= FALSE) 
}
deleteARow<-function(existingDF,r){
  existingDF<-existingDF[-r,]
  write.csv(existingDF,"~/ShinyApps/run/prova.csv",row.names= FALSE) 
}
