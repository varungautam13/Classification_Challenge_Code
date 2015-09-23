preproc <- function(dataset){
name <- dataset$Name
desc <- dataset$Description
# following <- dataset$Following_count
# followers <- dataset$Followers_count

dtm <- terms(desc, train=2)
termdf <- as.matrix(dtm)
termdf<- as.data.frame(termdf)


dtm <- terms(name, train=3)
namedf <- as.matrix(dtm)
namedf<- as.data.frame(namedf)


df <- cbind(termdf,namedf)
}