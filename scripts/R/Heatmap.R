library(readxl)
library(reshape2)

all_metabol <- read_xls("*.xls",sheet = 2)

data <- as.data.frame(all_metabol)

data<-(dcast(data, Pathway ~ species, value.var="genes"))
rownames(data)<-data$Pathway
data<-data[,-1]

data$zero<-rowSums(data!=0)<ncol(data)
data<-data[data$zero==FALSE,]
data<-data[,-5]
data<-as.matrix(data)

library(pheatmap)
# Heatmap 1
pheatmap(data,cluster_cols = FALSE,cluster_rows = FALSE,scale = "row",cellwidth = 25,display_numbers =  data)
# Heatmap 2
pheatmap(data,cluster_cols = FALSE,cluster_rows = FALSE,scale = "none",cellwidth = 25,display_numbers =  data)
# Heatmap 3
logdata<-log(data)
pheatmap(logdata,cluster_cols = FALSE,cluster_rows = FALSE,scale = "none",cellwidth = 25,display_numbers =  data)
