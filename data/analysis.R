#Analyses

#A number of variables are included in the raw data
#Only the variables representing subject, "response
#time," and congruence were of primary interest.
#Thus, these were the data analyzed and included
#in the presentation.

#Read in the data
d<-read.csv("rawdat.csv")

#First identify any impossible values.
#Words appear at about 29, so any values of
#29 or less reflect an error
#We'll grab subject numbers so we can eliminate them
badsubs<-unique(d$sub[d$rt<=29])

#use a clean df from which the bad subjects have been removed.
d<-d[!(d$sub %in% badsubs),]

#convert quarter, subject, and wordlist to factor variables
d$quarter<-as.factor(d$quarter)
d$sub<-as.factor(d$sub)

#See if congruent is faster than incongruent
t.test(d$rt[d$congruence=="Incongruent"],
       d$rt[d$congruence=="Congruent"],
       paired=TRUE,
       alternative="less")

#Load the ggplot2 library to create a box plot
library(ggplot2)

#Create and edit the box plot
f<-ggplot(d, aes(x=congruence,y=rt))+
  geom_boxplot()+
  guides(fill=FALSE)+
  labs(x="Word Color Congruence", y="Time Completed (seconds)")+
  scale_x_discrete(breaks=c("Congruent","Incongruent"),labels=c("Congruent","Incongruent"))+
  theme(axis.title.x=element_text(size=20,face="bold",vjust=-.8))+
  theme(axis.title.y=element_text(size=20,face="bold",vjust=1.5))+
  theme(axis.text.x=element_text(size=18,face="bold",color="black"))+
  theme(axis.text.y=element_text(size=18,face="bold",color="black"))+
  theme(panel.border=element_blank(), axis.line=element_line())+
  theme(panel.grid.major.x=element_blank())+
  theme(panel.grid.major.y=element_line(color="darkgrey"))+
  theme(panel.grid.minor.y=element_blank())

#Plot the box plot
f

#Save the figure for the presentation
ggsave(filename="fig1.png",width=15,height=15, units="cm",dpi=300)

#See if congruence interacts with order
summary(aov(rt~congruence*order+Error(sub/congruence), data=d))
#Nope. The order doesn't matter.

#How many participants showed the effect of congruence
showing<-sum(d$rt[d$congruence=="Incongruent"]>d$rt[d$congruence=="Congruent"])

#How many participants successfully completed the experiment?
n<-length(d$rt[d$congruence=="Incongruent"])

#What proportion showed the effect
showing/n
