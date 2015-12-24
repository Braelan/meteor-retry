library(ggplot2)
library(nutshell)

# load with source('ggplot2') 
data(outcome.of.care.measures.national)
data(medicare.payments)
data(medicare.payments.by.state)

# run bar chart.example for graph

bar.chart.example <- qplot(x=Condition, weight=Rate, data=outcome.of.care.measures.national, geom="bar", facets=Measure~., fill=Measure)

#run 

heart.failure <- c("Heart failure and shock w/o CC/MCC", "Heart failure and shock w MCC", "Heart failure and shock w CC")

#plot shows average cost by hospital for heart failure with and without comorbidities, along with the numner of cases treated
payment.plot <- qplot(x=Number.Of.Cases, y=Medicare.Average.Payment, data=subset(medicare.payments, Diagnosis.Related.Group %in% heart.failure), color=Diagnosis.Related.Group)

heart.failure.cost.plot <- qplot(x=log(Number.Of.Cases), y=Medicare.Average.Payment, data=subset(medicare.payments, Diagnosis.Related.Group %in% heart.failure), color=Diagnosis.Related.Group, ylim=c(0, 20000), alpha=I(1/10), geom = c("point", "smooth")) 
