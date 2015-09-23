a <- test_data %>% filter(!is.na(Description)) %>% select(UID,Handle,Description)
b <- sapply(strsplit(a$Description,"\\s+"), length)
df_tw <- cbind(a,b)
df_tw <- df_tw %>% filter(b<=15)
  
  for (i in 1: dim(a)[1])
  {
      tweets_user <- userTimeline(df_tw$Handle[i])
      tweetsDF <- twListToDF(tweets_user)
      tx <- paste(tweetsDF$text, collapse=" ")
      test_data$Description[test_data$UID==df_tw$UID[i]] <- paste(df_tw$Description[i],tx, collapse=" ")
      
    
  }
