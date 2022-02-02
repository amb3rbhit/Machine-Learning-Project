#R code to import and prepare the student performance dataset
setwd("C:/Users/HP/Desktop/YR 3/ST 3189/CW")

school1=read.table("student-mat.csv",sep = ";",header=TRUE)

install.packages('caret')
install.packages('skimr')
install.packages('ggcorrplot')
install.packages("picante")
install.packages('randomForest')
library(readr)
library(dplyr) 
library(DataExplorer)
library(tidyverse)
library(caret) 
library(rpart) 
library(skimr)  
library(ggcorrplot)
library(ggplot2)
library(caTools)
library(car) 
library(factoextra)
library(NbClust)
library(cluster)
library(Metrics)
library(randomForest)



#EDA 
any(is.na(school1))

glimpse(school1)
summary(school1)
skim(school1)

plot_histogram(school1)
plot_boxplot(school1, by = 'G3')

#dummy variable 
school1_ng12 = subset(school1, select = -c(G1, G2))
dum3 <- dummyVars(" ~ .", data = school1_ng12, fullRank = TRUE)
df_mat4 <- data.frame(predict(dum3, newdata = school1_ng12)) 
glimpse(school1_ng12)

#check collinearity
relation <- round(cor(df_mat4),1)
relation
ggcorrplot(relation,method="square", type = "lower", hc.order = TRUE, title="Correlogram of Mat variables", lab = TRUE, lab_size = 2,  colors = c("red", "white", "purple"), outline.color = "gray", show.legend = TRUE, show.diag = FALSE)

glimpse(df_mat4)

#plot of grades with no. of absences and studytime
ggplot(data = df_mat4, aes(absences,G3)) +
  geom_line() +
  geom_point() + 
  labs(title = "Absences and Studytime affecting G3 Grade", y = "G3", x = "Absences") + 
  facet_wrap(~ studytime)


#Linear Regression 

#PCA 
pcaschool1 <- princomp(df_mat4)
values <- get_eigenvalue(pcaschool1)
values
par(mfrow=c(1,1))
screeplot(pcaschool1, type = "l", npcs = 11, main = "Variance of Principal Components")
abline(h = 1, lty=5 , col="red")
options(max.print = 10000)
print(pcaschool1$loadings, digits = 4, cutoff = 0.01)
newdata_mat7 =subset(df_mat4, select = c(age, Medu, Dalc, Walc, absences, failures, Fedu, G3))

#Train Test Split 70%:30% 
tts1 = sample.split(newdata_mat7,SplitRatio = 0.3)
trainset3 =subset(newdata_mat7,tts1 == TRUE)
testset3 =subset(newdata_mat7,tts1 == FALSE)

#LR
lr3 <- lm(G3 ~ . , data = trainset3)
summary(lr3)
#Multiple R-squared:  0.2457,	Adjusted R-squared:  0.1883, p-value: 0.0003899

#to find multi-collinearity between variables & remove them 
vif(lr3)
plot <- vif(lr3)
barplot(plot, main = "VIF Values of Variables", horiz = TRUE, col = "lavender")

lr_results <- predict(lr3, newdata = testset3, type = 'response')
head(lr_results)

rmse(testset3$G3, lr_results)
#4.535792

#Random Forest 
set.seed(1)
rf <- randomForest(formula = G3 ~ .,data = trainset3)
rf
#Mean of squared residuals: 17.79304 , % Var explained: 22.84

which.min(rf$mse)
sqrt(rf$mse[which.min(rf$mse)])
# RMSE: 4.194652
plot(rf)
varImpPlot(rf)

RF_results1.1 <- predict(rf, newdata = testset3, type = 'response')
head(RF_results1.1)
auc(testset3$G3, RF_results1.1)
#0.7407


#scaling factors such as age 
minmax_normalisation <- function(x) {(x - min(x)) / (max(x) - min(x))}

df_tonorm <- subset(newdata_mat7, select = c(age, absences, G3, failures, Medu, Fedu, Walc, Dalc))
df_norm <- as.data.frame(lapply(df_tonorm, minmax_normalisation))

#train test split 70%:30%
norm = sample.split(df_norm,SplitRatio = 0.3)
trainset_norm  =subset(df_norm,norm == TRUE)
testset_norm  =subset(df_norm,norm == FALSE)

#Linear Regression
normmod <- lm(G3 ~ . , data = trainset_norm)
summary(normmod)
par(mfrow=c(2,2))
plot(normmod)
#Multiple R-squared:  0.247,	Adjusted R-squared:  0.1883, p-value: 0.0003899

par(mfrow=c(1,1))
vif(normmod)
normvof <- vif(normmod)
barplot(normvof, main = "VIF Values of Variables", horiz = TRUE, col = "lavender")

norm_results <- predict(model_norm, newdata = testset_norm, type = 'response')
head(norm_results)
rmse(testset_norm$G3, norm_results)
#rmse: 0.248359

#Random Forest 
set.seed(1)
rf2 <- randomForest(formula = G3 ~ .,data = trainset_norm)
rf2
#Mean of squared residuals: 0.0434758 , % Var explained: 24.59
which.min(rf2$mse)
sqrt(rf2$mse[which.min(rf2$mse)])
# RMSE: 0.2076087
plot(rf2)
varImpPlot(rf2)

RF_results1.2 <- predict(rf2, newdata = testset_norm, type = 'response')
head(RF_results1.2)
auc(testset_norm$G3, RF_results1.2)
#0.7315













### 

school2=read.table("student-por.csv",sep = ";",header = TRUE)

glimpse(sch2_dummy)

plot_histogram(school2)
plot_boxplot(school2, by = 'G3')

#take out G1 and G2 
school2_ng12 =subset(school2, select = -c(G1, G2))
#make dummy variables 
dum20 <- dummyVars(" ~ .", data = school2_ng12, fullRank = TRUE)
sch2_dummy <- data.frame(predict(dum20, newdata = school2_ng12)) 

#EDA 
#plot of grades with no. of absences and studytime
ggplot(data = sch2_dummy, aes(absences,G3)) +
  geom_line() +
  geom_point() + 
  labs(title = "Absences and Studytime affecting G3 Grade", y = "G3", x = "Absences") + 
  facet_wrap(~ studytime)


#Modeling 

#scaling factors 
sch2_tonorm <- subset(sch2_dummy, 
                      select = c(age, traveltime, studytime, failures, famrel, freetime, goout, Dalc, Walc, health, absences, Medu, Fedu, G3, 
                                 schoolMS, sexM, addressU, famsizeLE3, PstatusT, Mjobhealth , Mjobother, Mjobservices, Mjobteacher, Fjobhealth, Fjobother, Fjobservices, Fjobteacher, 
                                 reasonhome, reasonother, reasonreputation, guardianmother, guardianother, schoolsupyes, famsupyes, paidyes, activitiesyes, nurseryyes, higheryes, internetyes, romanticyes))
head(sch2_norm)
sch2_norm <- as.data.frame(lapply(sch2_tonorm, minmax_normalisation))

#train test split 70%:30%
sch2 = sample.split(sch2_norm,SplitRatio = 0.3)
trainset_sch2 =subset(sch2_norm,sch2==TRUE)
testset_sch2=subset(sch2_norm,sch2==FALSE)

#Linear Regression
lrsch2 <- lm(G3 ~ . , data = trainset_sch2)
summary(lrsch2)
#Multiple R-squared:  0.4864,	Adjusted R-squared:  0.3236, p-value: 2.4e-06
vif(lrsch2)
par(mfrow=c(2,2)) 
plot(lrsch2)


sch2_results <- predict(lrsch2, newdata = testset_sch2, type = 'response')
head(sch2_results)
rmse(testset_sch2$G3, sch2_results)
#rmse: 0.170499

#PCA 
pcasch2<- princomp(sch2_dummy)
ve3 <- get_eigenvalue(pcasch2)
ve3
screeplot(pcasch2, type = "l", npcs = 11, main = "Variance of Principal Components")
abline(h = 1, lty=5 , col="red")
options(max.print = 10000)
print(pcasch2$loadings, digits = 2, cutoff = 0.01)
#7 factors have variance >1,  age, studytime, failures, goout dalc, walc absences, g3

sch2_pca = subset(sch2_dummy, select = c(age, studytime, failures, goout, Dalc, Walc, absences, G3))
sch2_pca_norm <- as.data.frame(lapply(sch2_pca, minmax_normalisation))
sch2_pca_norm

pca2 = sample.split(sch2_pca_norm,SplitRatio = 0.3)
trainset_pca2 =subset(sch2_pca_norm,pca2 == TRUE)
testset_pca2=subset(sch2_pca_norm,pca2 == FALSE)

#Linear Regression 
pca2lr <- lm(G3 ~ . , data = trainset_pca2)
summary(pca2lr)
par(mfrow=c(2,2))
plot(pca2lr)
#Multiple R-squared:  0.2057,	Adjusted R-squared:  0.1698, p-value: 6.49e-06

par(mfrow=c(1,1))
vif(pca2lr)
vpca2 <- vif(pca2lr)
barplot(vpca2, main = "VIF Values of Variables", horiz = TRUE, col = "lavender")

norm_results <- predict(model_norm, newdata = testset_norm, type = 'response')
head(norm_results)
rmse(testset_norm$G3, norm_results)
#rmse: 0.248359

#Random Forest 
set.seed(1)
rf_sch2 <- randomForest(formula = G3 ~ .,data = trainset_pca2)
rf_sch2
#Mean of squared residuals: 0.0243142 , % Var explained: 29.42
which.min(rf_sch2$mse)
sqrt(rf_sch2$mse[which.min(rf_sch2$mse)])
# RMSE: 0.1545291
plot(rf_sch2)
varImpPlot(rf_sch2)

RF_results <- predict(rf_sch2, newdata = testset_pca2, type = 'response')
head(RF_results)
auc(testset_pca2$G3, RF_results)
#0.6721649
