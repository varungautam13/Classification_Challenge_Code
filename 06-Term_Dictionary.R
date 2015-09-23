library(readxl)
library(tm)
library(dplyr)
library(caret)
library(twitteR)
library(base64enc)

setwd("C:/Users/Varun/Desktop/Varun/ZS_Challenge")
#train_data <- read_excel("challenge_training data.xlsx")
train_data <- read.csv("updated_train_final.csv",sep=",", stringsAsFactors = F)
## description terms

desc_HCP <- train_data %>% 
    filter(Author_Category=="HCP") %>% 
  select(Description)

# #desc_HCP <- url_decode(desc_HCP)
# desc_HCP <- desc_HCP$Description

freq_terms_HCP <- terms(desc_HCP, train = 1)
train_terms_H <- freq_terms_HCP[-c(23,24,62.63)]

rm(freq_terms_HCP, desc_HCP)

## Name terms
name <- train_data$Name
hcp_name <- grep(",",name)
name_req <- name[hcp_name]
name_terms <- sub(".*,","",name_req)
name_terms <- unique(name_terms)
name_terms <- name_terms[-c(5,9,10,12,32,42,45,47,48,50,51,53,54,55)]

rm(name,hcp_name,name_req)
