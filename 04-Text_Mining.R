terms <- function(desc, train){
  txt.desc <- VectorSource(desc)
  txt.desc <- Corpus(txt.desc, readerControl = list(language = "en"))
  docs <- tm_map(txt.desc, content_transformer(tolower))
  docs <- tm_map(docs, removeWords, stopwords("english"))
  docs <- tm_map(docs, removeWords, c("tweets","views", "director", "university","http:","t.co", "opinions","com","www", "https:"))
  docs <- tm_map(docs, stripWhitespace)
  docs <- tm_map(docs, removeNumbers)
  toSpace <- content_transformer(function(x , pattern) gsub(pattern, " ", x))
  docs <- tm_map(docs, toSpace, "/")
  docs <- tm_map(docs, toSpace, "@")
  docs <- tm_map(docs, toSpace, "\\|")
  docs <- tm_map(docs, toSpace, "-")
  docs <- tm_map(docs, toSpace, "#")
  docs <- tm_map(docs, toSpace, "\\.")
  docs <- tm_map(docs, toSpace, "\\)")
  docs <- tm_map(docs, toSpace, "\\(")
  docs <- tm_map(docs, toSpace, ",")
  docs <- tm_map(docs, toSpace, ";")
  
  if(train==1){
    dtm <- DocumentTermMatrix(docs)
    freq_terms<- findFreqTerms(dtm, lowfreq = 40)}
  else if(train==2){
    dtm <- DocumentTermMatrix(docs, control = list(dictionary=train_terms_H)) 
    }
  else if(train==3){
      dtm <- DocumentTermMatrix(docs, control = list(dictionary=name_terms)) 
  }
  
}
