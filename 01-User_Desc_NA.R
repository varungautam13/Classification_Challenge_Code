User_Desc_na <- function(dataset){
  
  for (i in 1: dim(dataset)[1])
  {
    if(is.na(dataset$Description[i]))
    {
      tweets_user <- userTimeline(dataset$Handle[i])
      tweetsDF <- twListToDF(tweets_user)
      dataset$Description[i] <- paste(tweetsDF$text, collapse=" ")
        
     }
  return(dataset)
  }
}
