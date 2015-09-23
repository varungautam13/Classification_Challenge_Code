set.seed(100)
train_id <- createDataPartition(train_data$Author_Category, times=1,p=0.7, list=F)
training <- train_data[train_id,]

author_cat <- training$Author_Category

df <- preproc(training)
df <- cbind(df,author_cat)

rm(author_cat,training)
fit_1 <- train(author_cat~.,data=df,method="rf", 
             trControl=trainControl(method="repeatedcv",
                                    number=10))

fit_1$finalModel
summary(fit_1)

