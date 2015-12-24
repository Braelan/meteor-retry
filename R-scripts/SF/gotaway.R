library(ggmap)
library(ggplot2)
library(dplyr)
train <- read.csv("train.csv") 
map <- get_map(location="sanfrancisco", zoom=12, source="osm", color="bw") 
map_crime <- function(crime_df, ending, crime) {
  filtered <- filter(crime_df, Category %in% crime)
  plot <- ggmap(map, extent='device') + geom_point(data=filtered, aes(x=X, y=Y, color=Resolution, alpha=0.6))
  return(plot)
}

map_crime(train, c('NONE'), c('LARCENY/THEFT'))  
