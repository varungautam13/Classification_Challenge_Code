validation <- train_data[-train_id,]

author_categ <- validation$Author_Category

df1 <- preproc(validation)
pred <- predict(fit_1,df1)

confusionMatrix(author_categ,pred)
rm(author_categ)

