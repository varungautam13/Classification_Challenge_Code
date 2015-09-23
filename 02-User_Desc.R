User_Desc <- function(dataset){
  
  for (i in 1: dim(dataset)[1])
  {
    if(!is.na(dataset$Description[i]))
    {
      desc_each <- unlist(strsplit(dataset$Description[i]," "))
      user <- sub(",","",desc_each[grep("@",desc_each)])
      user <- sub("\\.","",user)
      if (length(user) !=0)
      {
        for (x in 1:length(user))
        {
          user_desc <- ""
          user[x] <- sub("@","",user[x])
          tryCatch ({user_tw <- getUser(user[x])
          user_desc <- user_tw$description}, error=function(e){})
          desc_each[grep("@",desc_each)[x]] <- paste(desc_each[grep("@",desc_each)[x]],user_desc)
          
        }
        dataset$Description[i] <- paste(desc_each, collapse=" ")
      } 
    }
  }
  return(dataset)
}