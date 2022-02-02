setwd("C:/Users/HP/Desktop/YR 3/ST 3189/CW")

ewcs=read.table("EWCS_2016.csv",sep =",",header = TRUE)
ewcs[,][ewcs[, ,] == -999] <- NA
kk=complete.cases(ewcs)
ewcs=ewcs[kk,]

install.packages('plyr')
install.packages('factoextra')
install.packages('NbClust')
install.packages('DataExplorer')
install.packages("ggplot2")
library(plyr)
library(factoextra)
library(NbClust)
library(cluster)
library(FactoMineR)
library(corrplot)
library(DataExplorer)
library(ggplot2)


colnames(ewcs)[1] = "Gender"
colnames(ewcs)[2] = "Age"
head(ewcs)

any(is.na(ewcs))

#checking data
summary(ewcs)
head(ewcs)
hist(ewcs$Age)
hist(ewcs$Gender)

#checking no of male & female 
m <- 0
f <- 0
for ( i in ewcs$Gender) {
  if (i == 1) {
    print(m)
    m = m+1 
    next
  } else {print(f)
      }}

for ( i in ewcs$Gender) {
  if (i == 2) {
    print(f)
    f = f+1 
    next
  } else {print(m)
  }} 
  
#M/1: 3899 F/2: 3747
dim(ewcs)
nrow(ewcs)
head(ewcs)

#to see freq of each x 
plot_histogram(ewcs)
mean(ewcs$Age)

#proportion of M/F to each question & Age
ggplot(ewcs) +
  geom_bar(aes(x = Gender, fill = Age))
ggplot(ewcs) +
  geom_bar(aes(x = Gender , fill = Q87a))
ggplot(ewcs) +
  geom_bar(aes(x = Age , fill = Q90a))

#principal component analysis 
PCA2 <- PCA(ewcs, scale.unit = TRUE, ncp = 11 , graph = TRUE)

evevev <- get_eigenvalue(PCA2)
evevev
# 3 variables that have eigenvalue of >1 explains 62% of the variance in data 
#data is standardised

#scree plot of eigenvalues to each component. 
fviz_eig(PCA2, addlabels = TRUE, ylim = c(0, 40))
#3 components explain 62% of variance of the data 

ewcs_var <- get_pca_var(PCA2)
ewcs_var

#to examine if the pca have given the variables a good split 
#to find out which var contribute the most to the component 
corrplot(ewcs_var$contrib, is.corr=FALSE)  
fviz_contrib(PCA2, choice = "var", axes = 1 ,fill = "light blue",color = "gray")
fviz_contrib(PCA2, choice = "var", axes = 2 ,fill = "light blue",color = "gray")

#to find out the quality of representation 
corrplot(ewcs_var$cos2, is.corr=FALSE)
#Q87a to Q90a have >0.5 cos2 value which shows a good representation of the variable on PC1 

#understanding the data from each individual 
person <- get_pca_ind(PCA2)
person

fviz_pca_ind(PCA2, col.ind = "coord", 
             gradient.cols = c("#CC66FF", "#FFCC99", "#FC5E06")
)

fviz_pca_biplot(PCA2, col.ind = "contrib",
                gradient.cols = c("#CC66FF", "#FFCC99", "#FC5E06"))

