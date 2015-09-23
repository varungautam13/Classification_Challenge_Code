#test_data <- read_excel("challenge_submission.xlsx")
test_data <- read.csv("updated_test_final.csv",stringsAsFactors = F)
test_data <- test_data[-1]
#test_data <- url_decode(test_data)
df2 <- preproc(test_data)
pred <- predict(fit_1,df2)

test_data_sub <- data.frame(UID=test_data$UID, Author_Category=pred)
summary(test_data_sub)
write.csv(test_data_sub, file="Submission_challenge_13.csv")

rm(author_categ,df,df1,df2,pred,test_data,train_data,test_data_sub,train_id,validation)
