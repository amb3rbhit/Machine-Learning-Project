# Machine Learning Analysis 

### We were given 3 different set of data to analyse using Unsupervised Learning, Supervised Learning - Classification & Regression. 

## Unsupervised Learning 

This dataset is the result of how Europeans feel during work and personal life. As there are no direct questions to their working environment, how they feel about their working environment will be inferred based on their feelings during the past 2 weeks. Using Principal Component Analysis, we will aim to uncover any insights that would help us to describe how they feel about their working conditions. 

### Exploratory Data Analysis

![histogram of freq vs value of all var](https://user-images.githubusercontent.com/58731312/152670501-9a9cf8ba-c0ed-4bf7-8c0f-21661f4879a1.png)
Figure 1. Histogram of Variables in dataset 

We can see that most of the respondents picked option 2, indicating that they feel what the question asked most of the time. The questions were about positive feelings, such as feeling active, fresh, rested, enthusiastic about my job. 

Interestingly, we can see that the question Q90f which asked, “In my opinion, I am good at my job”, many picked option 1 always. We can infer that the Europeans do take pride in what they are doing, and they enjoy their job. 

The average age range is from 32 years old to 54 years old. We can infer that they have been probably working for a while, be it in their current company or another company. 
Each of the questions has a similar proportion of age range and gender. 

### Principal Component Analysis

![scree plot unsupervised](https://user-images.githubusercontent.com/58731312/152670571-c96592e3-a094-4d6d-be97-85dd0bb01d94.png)
Figure 2. Scree Plot of Variance of Principal Components 

As shown in Figure 2, 3 principal components will be able to explain most of the analysis that we will make in the next few figures. 
We want to find which variable contributes the most to the first 2 components to be able to understand the data better.
Most of the variables that are contributing are the results of the questions as in figures 3 and 4. 

![dfds](https://user-images.githubusercontent.com/58731312/152670583-075c9449-4672-4921-869c-310decdfe699.png)
Figure 3. Contribution of variables to PC1 		        

![ggff](https://user-images.githubusercontent.com/58731312/152670587-ddf7b3af-bdda-4b31-b9cf-9e25128b6c3b.png)
Figure 4. Contribution of variables to PC2 

Based on Figure 5, the Europeans that were surveyed mostly have a similar feeling with one another as shown in Figure 1. The questions mostly shaped Principal Component 1, which is on the x-axis. 
From Figure 5, you can see that age and gender are almost 90 degrees from Q90f and c, which means these variables do not correlate. Hence their age and gender do not relate to how much time flies or whether they are good at their job. 

The age and gender lines are closer to Q87 which asks about how they have been feeling over the last 2 weeks. As most of their choices were that they felt cheerful, fresh, calm, and more most of the time, we can infer that the average age 43 years old feels this way. This is in the later stage of their life where they can slow down and enjoy life. 
In Figure 5, it might Q90 and Q87 are not extremely close, hence it will only affect each other to some extent. Their daily life feelings will affect how they feel at work to an extent. Hence, for someone who feels that their daily life has been filled with things that interest them, they are likely to enjoy work, and time flies when working. Overall, we can infer that their working conditions are suitable for their current lifestyle.   

![bioplot](https://user-images.githubusercontent.com/58731312/152670652-518673ed-8ce3-4cda-99f7-1000149d0cc8.png)
Figure 5. PCA Bioplot 
 
## Supervised Learning - Classification 

The dataset contains the outcome of the marketing campaign data with information such as the client’s detail, how the campaign was carried out, as well as if the marketing campaign has worked to entice the client to put in a term deposit. 

### Exploratory Data Analysis

![hist of bank](https://user-images.githubusercontent.com/58731312/152670670-7fbedea3-ea91-43df-b1c1-9915e9dc6568.png)
Figure 6. Histogram of Numeric Variables in Dataset     

![box plot](https://user-images.githubusercontent.com/58731312/152670684-e8133cbc-ab3d-4e5b-ae51-fb04f8586ecf.png)
Figure 7. Boxplot of Duration of call to Output Variable  

To start, we will look at the frequency of the numeric variables. Figure 6 is a histogram of the numeric variables in the dataset. The variable campaign represents the number of contacts performed during this campaign and for the specific client. The maximum number of contacts is 50. Comparing to the variable previous which is the number of contacts performed before this campaign and for the specific client, they have made more phone calls during this campaign. The average duration of phone calls is 264 minutes. The average age is 41 years old. There is a pattern of the last contact of the day of the month. The bar can be seen increasing 3 times, one at the start, after every 10th, and after every 20th. The greatest number of people contacted was on the 16th. The balance variable is the balance of the individual.

Next, we explore the relationship of the output variable with the different numeric variables. As the duration of the call will affect the output target which indicates if the client pays the term deposit or not, we plot a boxplot to examine the relationship. From figure 7, we can see that the higher the duration, the more client are likely to subscribe. However, there are also some exceptions where even if the duration is long, the client has not subscribed. This tells us that we need to consider other factors as well that would lead to this situation. 

The variable Balance is not very clear what exactly the value means in primary and secondary sources, which makes me infer that it is either the balance in their bank account which allows the variable to produce a negative number. Just to explore, plotting it against the different jobs would give some perspectives to the numbers. Here in Figure 8, we can see that the outlier that has a $71188 balance belongs to the retired. Students, the unemployed, and those with unknown jobs tend to have lesser balance, they might not have enough to subscribe to a term deposit. Therefore, the people who are working as an admin, management, and retirees will have a higher chance of subscribing.  

![plot job x balance](https://user-images.githubusercontent.com/58731312/152670701-7f227cd4-9366-4720-9944-3e8ca6ad5547.png)
Figure 8. Balance to the job they currently hold 

Looking at figure 9, most of the clients who did not subscribe, and their duration of the call is <1000 seconds crowds around the age range of 25 to 60. The outlier that had the longest call is about age 58 did not subscribe. The time could be reduced here to call other potential clients. Hence calls should be kept at a maximum of 2500 seconds. 

![repost3](https://user-images.githubusercontent.com/58731312/152670710-8444a2a5-1800-4bed-b74b-acc91caf42c1.png)
Figure 9. Term Deposit with Age and Duration       

In figure 10, we can gauge how many clients took a personal loan concerning their jobs. There is a high number of entrepreneurs that took a personal loan, while student and clients whose job is unknown have the lowest number of taking a personal loan. 
There is a higher number of clients who did not take a loan and subscribed to a term deposit. Perhaps they are not tied down with loans to pay which makes them comfortable to subscribe.

![moasic plot loan x job](https://user-images.githubusercontent.com/58731312/152670715-1d3d5c63-afb2-4b17-b52c-ecca4fb19e3e.png)
Figure 10. Job positions that took loans  
![bar plot - contact](https://user-images.githubusercontent.com/58731312/152670736-16659a88-09d9-4b88-818c-e14d1de56075.png)
Figure 11. Term Deposit to Contact Type         
![barplot - housing](https://user-images.githubusercontent.com/58731312/152670742-50428da2-2814-45bb-9c93-19dde9ac5a0d.png)
Figure 12. Term Deposit to Housing Loan    
![barplot - poutcome of marketing camp](https://user-images.githubusercontent.com/58731312/152670745-0d6d9021-8514-42a2-a533-7749c2a73f11.png)
Figure 13. Term Deposit to Previous Outcome  
![barplot - credit](https://user-images.githubusercontent.com/58731312/152670749-d1ec5e99-9e11-4261-a173-726c873b2a24.png)
Figure 14. Term Deposit to Credit in Default
![bar plot loan x y](https://user-images.githubusercontent.com/58731312/152670750-7ee3b91b-b4ee-4427-94c7-3d9d6ac930cd.png)
Figure 15. Term Deposit to Personal Loan  
![y](https://user-images.githubusercontent.com/58731312/152670752-9e7bc8b5-4a50-4c57-9ac0-4b04db822676.png)
Figure 16. Term Deposit Count 

Figure 16 shows a high number of clients who did not subscribe during this marketing campaign. Figure 11 to 15 shows the relationship of clients subscribing to the different categorical variables. 
Many contacts made via cellular communication to clients yield a higher chance of getting them to subscribe. Moving forward, this could the main mode of communication to market the campaign. 
For housing loans, there is not a significant difference whether they have a loan and if they subscribed or not. Generally, the clients who do not have a housing loan have more monetary power to subscribe to a term deposit. 

The previous outcome of the marketing campaign shows that most of the unknown outcomes yield the most subscribers. Compared to the number of clients who did not subscribe, it is a small number. However, those with a successful outcome in the previous round tend to be successful this time around too. Hence, it is important to be successful so that clients can trust us and put in a term deposit again. 
Many clients do not have credit in default, but some of them still subscribe to the term deposit, as shown in figure 14. 

To sum up the insights, there need not be a long duration of the call to gain subscribers as 0 seconds would also gain some. There would be more successful with clients holding jobs for management, admin, and retirees. Using cellular as the communication would yield a higher level of success, and clients who have no loans and credit would be more likely to subscribe. 

### Logistic Regression 

Figure 17 shows the diagnostic plots of the model after the train set has gone through Logistic Regression. 

![repost22](https://user-images.githubusercontent.com/58731312/152670804-f126356f-8178-4fd6-9fb8-d53884269d95.png)
Figure 17. Diagnostic Plot of Logistic Regression 

The plots generally do not have any alarming indication of our data not fitting the model. Our model is not biased towards a direction based on the variations of the model. The model has low null deviance, which does not make sense as we have many parameters in our model. Our residual deviance is also low, which indicates an appropriate model. However, it is nowhere close to the degrees of freedom which tells us that the data is not that well fitted. 

However, the residual mean square error tells us if the model is a good fit for the data or not, the lower the better. Our model has a root mean square error of 0.4. The area under the curve is a validation of the model. The closer it is to 1, the better the model fits. Here, our model has an area of 0.7 which indicates that it is a good fit. 

The significant variables are the retirees, have a personal loan, the unknown mode contact, month of March, October, and December, number of contacts previously, and that the outcome of the previous campaign is successful in getting the clients to subscribe. 
We will look at the inverse relationships between getting the client to subscribe and the variables. For clients who have a personal loan in place, they are not likely to subscribe. Clients who were contacted via a mode of unknown contact type, would also not likely to subscribe. 

On the other hand, some relationships are positive between output and variables. As seen in figure 8, the retirees have more balance and can likely subscribe to a term deposit. The months where the bank can make more contacts with a higher likelihood of getting clients to subscribe are March, October, and December. When the previous campaign had success with the client, the client is highly likely to subscribe during this marketing campaign as well. The higher the clients that were contacted before the campaign, the more likely they are to subscribe to a term deposit. 

The positive relationships between the output and the variables will help the bank to target the specific areas to put more focus on. This helps the bank to improve their sales in getting more clients to subscribe to a term deposit. As for the inverse relationships, the bank is advised to discontinue using those methods to contact clients and shift their focus areas. 

Though the model can be used to predict if the customer will subscribe to a term deposit, it can be improved further by fitting feature variables. 

## Supervised Learning - Regression 

These datasets aim to predict the performance of the students for their final grade, in both Mathematics and Portuguese Language. It will not be merged as predicting them separately would ensure a more accurate representation of their grades in the respective subjects. 
Exploratory Data Analysis – Mathematics 

![hist mat](https://user-images.githubusercontent.com/58731312/152670938-f83394f0-2771-4352-8a3e-92d410f73f1c.png)
Figure 18. Histogram of Variables 

![boxplot g3mat](https://user-images.githubusercontent.com/58731312/152670972-1cf1a452-e5c0-4c0f-842b-d490846d52b8.png)
Figure 19. BoxPlot of G3 to Variables 

![repost](https://user-images.githubusercontent.com/58731312/152670984-f62105f2-9303-4141-9396-b0c15a3ecd49.png)
Figure 20. Absences and Studytime affecting G3    

![box plot g3 mat](https://user-images.githubusercontent.com/58731312/152670955-86894bcd-8e96-40dc-9c83-568081f5e544.png)

Basing on figure 18, most of the students seem not to have any major issues with family, health, and attending school. The grades seem to follow a curve where most students will tend to hit the passing mark which is 10. In figure 19, for page 1 and page 2, there seem to be some outliers when it came to their absences, failures and weekday alcohol consumption, and family relationships. The students who are faced with low absences, high failure rate, high alcohol consumption, and bad family relationships tend to fail the subject as their marks are below the passing rate. 

Students who did well for G1 and G2 also tend to do well in G3. Students that are failing more than once could use some help to boost their grades. As the number of students who have the most absences are at the passing mark, we plotted to see if the study time they had helped them to pass as they did not attend lessons. 

In figure 20, most students studied 2-5 hours. Not all of them that are absent managed to pass. The student with about 53 absences managed to pass with 2-5 hours of study time weekly. Some students who were not absent did not manage to pass. This tells us that their absences might not be the cause of the students who did not pass. 

### Linear Regression – Mathematics
![LR MAT](https://user-images.githubusercontent.com/58731312/152670959-89f42905-a9eb-4d6a-b619-055d37cd6b04.png)
Figure 21. Diagnostic Plot of Linear Regression Model 
 
![VIF mat](https://user-images.githubusercontent.com/58731312/152670960-b277f7d2-5ca1-4375-99ba-01daae6f094e.png)
Figure 20. Variance Inflation - Factor Values of Variables   
The number of variables was reduced using Principal Component Analysis and narrowed down to 7 features. This is the result of fitting the data through linear regression. 

Figure 21 shows that overall, the model is good to be used to predict the G3 score. However, we must take in other considerations. Figure 22 helps us check if any of the variables are correlated to avoid multicollinearity. Since no variables are above the value of 5, they are not correlated. 

Standardizing the factors help us to omit the units attached to numbers, helping the computer understand and differentiate the variables. The adjusted R^2 output is 0.2, and the p-value is less than 0.05. The model seems significant to predict, however, the data points do not fit the model well due to a low adjusted R^2 output. 
The data is not bias towards one direction as the median is 0.02, close to 0. There are a few variables that are statistically significant such as the Intercept, Age, Failures and Mother Education. As the grades increases, the students tend to be lower in age. Their number of failures will also tend to be lower. However, when the grade increases, the student’s mother will tend to have a better education level. 

![rf1](https://user-images.githubusercontent.com/58731312/152671000-aa29e9df-050e-440c-99b7-70f2e03c2bc7.png)
Figure 23. Importance of Variables in Random Forest    
To improve the model, random forest which is a tree-based method is used. The output of the root means square error is low, and the area under the curve is 0,7 which fits the model well. From figure 23, we can also see that absences affect G3 the most, followed by failures and age and mother’s education.                      

 
### Exploratory Data Analysis – Portuguese 

![hist pot](https://user-images.githubusercontent.com/58731312/152671100-06e2f749-3c64-443f-8338-48a79f24ef50.png)
Figure 24. Histogram of Variables   

![pot box 1](https://user-images.githubusercontent.com/58731312/152671103-d0a5debd-58b4-4dd5-bbac-836b894dd5ef.png)	   	            
Figure 25. BoxPlot of G3 to Variables

![plot pot](https://user-images.githubusercontent.com/58731312/152671110-a29811ce-d08f-466c-b5a9-c62e58d80f36.png)
Figure 26. Absences and Studytime affecting G3
![pot box 2](https://user-images.githubusercontent.com/58731312/152671112-2ba8f1d6-b2ef-47cb-a399-85fb5610efea.png)

From figure 24, we can see a higher percentage of students passing the Portuguese Language subject as compared to Mathematics. Most of them do not have to fail this subject, and there is a lower number of absences. 

In figure 25, the number of absences increases as the grade gets higher. In G1 and G2, some outliers show that even while scoring low for G1 and G2, they can pull themselves to pass G3. Unlike Mathematics, Portuguese Language seems easier to score and study for even without attending as many lessons.

In figure 26, it is evident that students can score better in Portuguese Language without much time spent on studying and going to classes. Students who studied 10 or more hours a week generally have a passing grade, with minimal failures as compared to Mathematics. Even with a higher number of absences, and less than 5 hours of study a week, students can receive a passing grade in Portuguese Language.

### Linear Regression – Portuguese 

Figure 27 shows the diagnostic plots of the model after the train set has gone through the linear regression. 

![LR POT](https://user-images.githubusercontent.com/58731312/152671118-8e0f1a1d-3bbb-4a06-bea4-5a12e453acc8.png)
Figure 27. Diagnostic Plot of Linear Regression Model   

![vifpot](https://user-images.githubusercontent.com/58731312/152671133-37c90939-2386-46d4-972b-877061452a9b.png)
Figure 28. Variance Inflation Factor Values of Variables 

The number of variables was reduced using Principal Component Analysis and narrowed down to 7 features. This is the result of fitting the data through linear regression. 

Residuals vs Fitted graph tells us that the residuals are spread equally around the line, and there are some outliers at the bottom of the graph. It shows that our model has a high chance that it does not have a non-linear relationship. The Normal Q-Q plot has the residuals mostly following the straight line which tells us the residuals are mostly normally distributed. Though we do have to take note of the area around 441, which was an outlier in the previous plot. The model is not biased to one direction as the median is 0.01, which is close to 0. 

The plot Scale-Location checks the assumption of equal variance. In our plot, our variance are not constant, and some of the residuals are crowding at one area. The last plot is to check if the outliers are influential to the model that we have used. There is no outlier outside of Cook’s distance which means that the outliers we have seen earlier are not influential to the model.

The significant coefficients of the linear regression are the Intercept, study time, and failures. As the grade increases, the study time tends to increase. Referring to figure 27, we can see that students who study more tend to have a lower chance of failing. When their number of failures decreases, the students will have better grades as seen evidently in figure 28. 

Overall, the model has a fairly good performance with good cases, even with a lower adjusted R^2. The root means square error tells us if the model is a good fit for the data or not, the lower the better. Our model has a residual mean square error of 0.17. The model is significant and can be used to predict G3 score of the students taking Portuguese subject. 

![DALC RF](https://user-images.githubusercontent.com/58731312/152671142-6733aae7-18e4-44e4-99f0-a15c89652feb.png)
Figure 29. Importance of Variables in Random Forest    

To improve the model, random forest which is a tree-based method is used. From figure 21, we can also see that weekday alcohol consumption affects G3 the most, followed by failures and age and absences. alcohol intake on a weekday affects their grades, followed by failures. This is an interesting insight as Mathematics did not have this situation. However, it contradicts the earlier linear regression model. Hence, the linear regression model seems to be a better fir for this dataset instead. 
 

## References
1.	Kassambara (2017) Principal Component Methods in R: Practical Guide. Principal Component Analysis in R: prcomp vs princomp [Online] Available at: http://www.sthda.com/english/articles/31-principal-component-methods-in-r-practical-guide/118-principal-component-analysis-in-r-prcomp-vs-princomp/#package-for-pca-visualization [Accessed: 31 03 2021] 
2.	Rajprasad, D (n.d.) Predicting the performance of Students [Online] Available at: http://rstudio-pubs-static.s3.amazonaws.com/234309_d6310e36d1284c54a5955d4f42a0af38.html [Accessed: 31 03 2021]
3.	Data Tricks (2019) One-hot encoding in R: three simple methods [Online] Available at: https://datatricks.co.uk/one-hot-encoding-in-r-three-simple-methods [Accessed: 31 03 2021]
4.	Griesemer, J (2019) Using R for Exploratory Data Analysis (EDA) — Analyzing Golf Stats [Online] Available at: https://towardsdatascience.com/using-r-for-exploratory-data-analysis-eda-analyzing-golf-stats-812b5feb077a [Accessed: 31 03 2021]
5.	Tutorialspoint (n.d.) R - Multiple Regression [Online] Available at: https://www.tutorialspoint.com/r/r_multiple_regression.htm [Accessed: 31 03 2021]
6.	Sharma, R (2020) Multiple Linear Regression in R [With Graphs & Examples] [Online] Available at: https://www.upgrad.com/blog/multiple-linear-regression-in-r/ [Accessed: 31 03 2021]
7.	Lillis, D (n.d.) Linear Models in R: Plotting Regression Lines [Online] Available at: https://www.theanalysisfactor.com/linear-models-r-plotting-regression-lines/ [Accessed: 31 03 2021]
8.	ALLISON, P (2012) When Can You Safely Ignore Multicollinearity? [Online] Available at: https://statisticalhorizons.com/multicollinearity [Accessed: 31 03 2021]
9.	Ng, N (n.d.) Evaluating a Linear Regression Model [Online] Available at: https://www.ritchieng.com/machine-learning-evaluate-linear-regression-model/ [Accessed: 31 03 2021]
10.	Zach (2019) How to Normalize Data in R [Online] Available at: https://www.statology.org/how-to-normalize-data-in-r/ [Accessed: 31 03 2021]
11.	Larson B (2016) R: Decision Trees (Regression) [Online] Available at: https://analytics4all.org/2016/11/23/r-decision-trees-regression/ [Accessed: 31 03 2021]
12.	Kedia, N (2018) How to split Train and Test data in R [Online] Available at: https://www.analytics-tuts.com/how-to-split-train-and-test-data-in-r/ [Accessed: 31 03 2021]
13.	Zach (2020) How to Build Random Forests in R (Step-by-Step) [Online] Available at: https://www.statology.org/random-forest-in-r/ [Accessed: 31 03 2021]
14.	Elsevier (2014) A Data - Driven Approach to Predict the Success of Bank Telemarketing [Online] Available at: http://repositorium.sdum.uminho.pt/bitstream/1822/30994/1/dss-v3.pdf [Accessed: 31 03 2021]
15.	Larson, B (2016) R: Decision Trees (Classification) [Online] Available at: https://analytics4all.org/2016/11/22/r-decision-trees-classification/ [Accessed: 31 03 2021]
16.	Statinfer (2017) 203.3.10 Pruning a Decision Tree in R [Online] Available at: https://statinfer.com/203-3-10-pruning-a-decision-tree-in-r/ [Accessed: 31 03 2021]
17.	Truong, K (2020) Bank Marketing EDA [Online] Available at: https://www.kaggle.com/kristrng/bank-marketing-eda [Accessed: 31 03 2021]
18.	Haaf, S (2019) Easy multi-panel plots in R using facet_wrap() and facet_grid() from ggplot2 [Online] Available at: http://zevross.com/blog/2019/04/02/easy-multi-panel-plots-in-r-using-facet_wrap-and-facet_grid-from-ggplot2/ [Accessed: 31 03 2021]
19.	Kim, B (2015) Understanding Diagnostic Plots for Linear Regression Analysis [Online] Available at: https://data.library.virginia.edu/diagnostic-plots/ [Accessed: 31 03 2021]
20.	Döring, M (2018) Interpreting Generalized Linear Models [Online] Available at: https://www.datascienceblog.net/post/machine-learning/interpreting_generalized_linear_models/ [Accessed: 31 03 2021] 
21.	R project (2020) Package ‘factoextra’ [Online] Available at: https://cran.r-project.org/web/packages/factoextra/factoextra.pdf [Accessed: 01 04 2021]


