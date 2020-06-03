library(XLConnect)
library(ggplot2)
Str_len <- readWorksheetFromFile(file = "*.xlsx",sheet=1)

library(plyr)
mu <- ddply(Str_len, "Species", summarise, grp.mean=mean(Str_element))

ggplot(Str_len, aes(x = Str_len, fill= Species, stat(count))) + geom_bar(position="identity", alpha=0.4) + scale_x_continuous(breaks = seq(0,400,by=50)) + xlab(" ")+ ylab(" ") + scale_y_continuous(breaks = seq(0,2500,by=500)) + theme_classic()+theme(axis.text.x=element_text(size=12, family="Times"),axis.text.y=element_text(size=12, family="Times"),axis.title.x=element_text(size=16,family="Times"),axis.title.y=element_text(size=16,family="Times"))+geom_vline(data=mu, aes(xintercept=grp.mean, color=Species), linetype="dashed")+ geom_density(position="identity",alpha=0.3,aes(col=Species))

       
