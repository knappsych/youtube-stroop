#Preprocessing of 440Winter2015.csv and Spring2015.csv to create rawdat.csv.
#The output (rawdat.csv) is suitable for data analysis

#Load the data.

springd<-read.csv("Spring2015.csv")

#Make the data easier to work with
library(dplyr)

#Standardize the conditions
springd<-springd%>%mutate(Condition=ifelse(
    Condition=="January" | Condition=="May" | Condition=="September", 1, ifelse(
        Condition=="February" | Condition=="June" | Condition=="October", 2, ifelse(
            Condition=="March" | Condition=="July" | Condition=="November", 3, ifelse(
                Condition=="April" | Condition=="August" | Condition=="December", 4, Condition)))))

#Make sure there are no other values
sum(ifelse(springd$Condition!=1&springd$Condition!=2&springd$Condition!=3&springd$Condition!=4,1,0))

#Indicate the Order of Congruence
springd<-springd%>%mutate(Order=ifelse(Condition%%2,'InCon','ConIn'))#No remainder for congruent first

#Indicate the times for the congruent and incongruent trials
springd<-springd%>%mutate(Contime=ifelse(Order=="ConIn", T1,T2))
springd<-springd%>%mutate(Intime=ifelse(Order=="ConIn", T2,T1))

#Indicate the that everyone in springd came from the spring quarter
springd$quarter<-rep("spring", length(springd$Condition))

#Let's grab the data from the winter
winterd<-read.csv("440Winter2015.csv")

#Make sure all the conditions make sense
sum(ifelse(winterd$Condition!=1&winterd$Condition!=2&winterd$Condition!=3&winterd$Condition!=4,1,0))

#One weird value. Condition=6??? Could be June (condition 2 or just some even numbered condition)
#Will exclude from analyses
winterd<-winterd%>%mutate(Exclude=ifelse(Condition==6,TRUE,FALSE))

#Indicate the first condition
winterd<-winterd%>%mutate(Order=ifelse(Condition%%2,'InCon','ConIn'))#No remainder for congruent first

#Indicate the that everyone in winterd came from the winter quarter
winterd$quarter<-rep("winter", length(winterd$Condition))

#Create a data frame to hold all our data
alld<-data.frame(
    quarter=c(winterd$quarter[winterd$Exclude==FALSE],springd$quarter),
    condition=c(winterd$Condition[winterd$Exclude==FALSE],springd$Condition),
    contime=c(winterd$Congruent[winterd$Exclude==FALSE],springd$Contime),
    intime=c(winterd$Incongruent[winterd$Exclude==FALSE],springd$Intime),
    order=c(winterd$Order[winterd$Exclude==FALSE],springd$Order)
)

#Get the number of the participants
n<-length(alld$contime)

#Assign each participant a number for this within-subjects design
alld$sub<-1:n

#Make the subject number a factor
alld$sub<-as.factor(alld$sub)

#Create a group variable to track the combination of lists and congruence
alld$group<-as.factor(alld$condition)

#Assign everyone to the congruent condition for now
alld$condition<-"Congruent"

#We're going to double the data frame to have one observation per row
doubled<-rbind(alld,alld)

#We're going to use the second half of the data frame for the incongruent condition
doubled$condition[(n+1):(n*2)]<-"Incongruent"

#Factor the condition variable
doubled$condition<-as.factor(doubled$condition)

#Create Response Time Variable that will hold the "response time" for
#congruent and incongruent conditions. We'll use the contimes (i.e. congruent times)
#for the congruent conditions and vice versa.
doubled$rt<-ifelse(doubled$condition=="Congruent",doubled$contime,doubled$intime)

#Put together our final data frame.
#We can get rid of First as we have that information in the time variable.
doned<-data.frame(quarter=doubled$quarter,
                  group=doubled$group,
                  sub=doubled$sub,
                  congruence=doubled$condition,
                  order=doubled$order,
                  rt=doubled$rt)

#Save the file
write.table(doned,"rawdat.csv",sep=",",row.names=FALSE)
