bank=read.table("bank.csv",sep=";",header=TRUE)

library(readr)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(caret) 
library(rpart)
library(skimr) 
library(DataExplorer)
library(ggcorrplot)
library(caTools)  
library(Metrics)
library(pROC)

glimpse(bank)
summary(bank)
any(is.na(bank))

bank_copy <- subset(bank)
bank_copy

#Exploring the data 

#categorical variables in relation to var y 
ggplot(bank) +
  geom_bar(aes(x = loan, fill = y))
ggplot(bank) +
  geom_bar(aes(x = housing, fill = y))
ggplot(bank) +
  geom_bar(aes(x = contact, fill = y))
ggplot(bank) +
  geom_bar(aes(x = poutcome, fill = y))
ggplot(bank) +
  geom_bar(aes(x = default, fill = y))
ggplot(bank) +
  geom_bar(aes(x = y, fill = y))

#find which job is most likely to take a loan 
mosaicplot(job ~ loan, data = bank, col = c("lightblue","pink"))

#numeric variables 
plot_histogram(bank)

#plot y to duration of call 
boxplot(bank$duration ~ bank$y, main = "Boxplot for Duration of call and Subcribers",
        xlab = "Client Subscribed",
        ylab = "Duration of Call")

#R/s of Balance with other variables 
ggplot(data = bank, aes(x = job, y = balance, group = 1)) +
  geom_line(linetype = "blank")+
  geom_point()


#relation of age to the duration to y 
ggplot(data = bank, aes(age, duration)) +
  geom_line(linetype = "blank") +
  geom_point() + 
  labs(title = "Term Deposit with Age", y = "Duration", x = "Age") + 
  facet_wrap(~ y)


#Preparing Data for Model 

#Dummy Variables 
dum <- dummyVars(" ~ .", data = bank_copy, fullRank = TRUE)
bank_dummy2 <- data.frame(predict(dum, newdata = bank_copy)) 
head(bank_dummy2)

bankdum <- subset(bank_dummy2, select = -c(duration))
head(bankdum)
#logistic regression
#train test split 70%:30% 
ttttt = sample.split(bankdum,SplitRatio = 0.3)
trainset1=subset(bankdum,ttttt==TRUE)
testset1=subset(bankdum,ttttt==FALSE)

glm1<- glm(yyes ~ . , data = trainset1)
summary(glm1)
par(mfrow=c(2,2))
plot(glm1)
#to access model 


#prediction of logistic regression model 
Lr_predict <- predict(glm1, newdata = testset1, type = 'response')
head(Lr_predict)

#checking for rmse 
rmse(testset1$yyes, Lr_predict)
#RMSE: 0.4, good fit for the lines 

#AU - ROC for validation of the model 
auc_roc <- auc(testset1$yyes, Lr_predict)
auc_roc
# Area under the curve: 0.7 -> model is a good fit 