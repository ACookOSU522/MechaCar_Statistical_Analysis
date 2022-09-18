#Deliverable 1
#Install dplyr pkg
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:
  
  filter, lag

The following objects are masked from ‘package:base’:
  
  intersect, setdiff, setequal, union

> setwd("C:/Users/crlyg/OSU_Bootcamp/R_Analysis")
#Import CSV
> Predict_MPG_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
> View(Predict_MPG_table)
> #Perform the linear regression using lm()function passing all six variables with mpg as the y axis
> Mecha_mpg_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = Predict_MPG_table)
#summary determin p-value and r-squrd for linear regress mod
> summary(Mecha_mpg_lm)

#Deliverable 2
#create a total summary dataframe that has the mean, median, variance, and standard deviation of the PSI for all manufacturing lots
> Suspensioncoil_table<- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
# create a lot summary dataframe that has the mean, median, variance, and standard deviation for each manufacturing lot
> total_summary <- Suspensioncoil_table %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
#  summary that addresses the design specification requirement for all the manufacturing lots and each lot individually
>lot_summary <- Suspensioncoil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

#Deliverable 3
#t-test that compares all manufacturing lots against mean PSI of the population
t.test(Suspensioncoil_table$PSI, mu=1500)
#three t-tests that compare each manufacturing lot against mean PSI of the population
#Lot 1
t.test((subset(Suspensioncoil_table, Manufacturing_Lot=='Lot1'))$PSI, mu=1500)
#Lot2
t.test((subset(Suspensioncoil_table, Manufacturing_Lot=='Lot2'))$PSI, mu=1500)
#Lot 3
t.test((subset(Suspensioncoil_table, Manufacturing_Lot=='Lot3'))$PSI, mu=1500)

