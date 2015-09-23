url_decode <- function(dataset){
  
  for (i in 1: dim(dataset)[1])
  {
    if(!is.na(dataset$Description[i]))
    {
      desc_each <- unlist(strsplit(dataset$Description[i]," "))
      url <- desc_each[grep("http",desc_each)]
      
      if (length(url)!=0)
      {
        for (x in 1:length(url))
        {
          
          y <- unlist(strsplit(url[x],""))
          if(y[length(y)]==".")
          {
            url[x] <- substr(url[x],1,nchar(url[x])-1)
          }
          url[x] <- decode_short_url(url[x])
          desc_each[grep("http:",desc_each)[x]] <- url[x]
          
        }
        dataset$Description[i] <- paste(desc_each, collapse=" ")
        
      }
      
    }
  }
  return(dataset)
} 