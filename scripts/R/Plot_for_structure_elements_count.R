library(XLConnect)
library(ggplot2)
Str_data <- readWorksheetFromFile(file = "*.xlsx",sheet=1)

library(plyr)
mu <- ddply(Str_data , "Species", summarise, grp.mean=mean(Str_element))

ggplot(Str_data, aes(x = Str_element, fill = Species, color = Species)) + geom_bar(position="identity", alpha=0.3)+ xlab(" ") + ylab(" ")+scale_x_continuous(breaks = seq(0,65,by=5)) + scale_y_continuous(breaks = seq(0,1100,by=100)) + theme_classic()+ theme(axis.text.x=element_text(size=12, family="Times"),axis.text.y=element_text(size=12, family="Times"),axis.title.x=element_text(size=16,family="Times"),axis.title.y=element_text(size=16,family="Times"))+geom_vline(data=mu, aes(xintercept=grp.mean, color=Species), linetype="dashed") 


