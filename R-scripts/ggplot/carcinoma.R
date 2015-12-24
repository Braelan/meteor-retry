library(ggplot2)
library(XLConnect) 

data <- readWorksheet(loadWorkbook("CarcinomaNormaldatasetCancerResearch.xls"), sheet=4) 

# x represents the mean intensity of the gene expression in tumor cells

# y represents the mean intensity of the gene expression in normal cells

# plot a 1 to 1 ration on same graph

# expression in all tumor genes
tumors <- data.matrix(data[8:7464, 4:20])
#
mean.gene.expression.tumors <- rowMeans(tumors, na.rm=TRUE)

normals <- data.matrix(data[c(8:8464), c(22:39)])

mean.gene.expression.normal <- rowMeans(normals, na.rm=TRUE)

gene.expression.matrix <- data.frame(rbind(mean.gene.expression.tumors[1:7456], mean.gene.expression.normal[1:7456]))


rownames(gene.expression.matrix) <- c("tumors", "normals")

gene.expression.data <- data.frame(t(gene.expression.matrix))

 expression.intensity.plot <-qplot(x=normals, y=tumors, data= gene.expression.data )

geom_abline(intercept = 0, slope = 1)
