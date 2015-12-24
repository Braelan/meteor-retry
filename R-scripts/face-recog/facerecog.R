library(doMC)
registerDoMC()

train.file <- 'training.csv'
test.file <- 'test.csv'

d.train <- read.csv(train.file, stringsAsFactors=F)

im.train <- d.train$Image
d.train$Image <- NULL

im.train <- foreach(im = im.train, .combine=rbind) %dopar% { as.integer(unlist(strsplit(im, " "))) }

str(im.train)

d.test <- read.csv(test.file, stringsAsFactors=F)
im.test <- foreach(im = d.test$Image, .combine=rbind) %dopar% { as.integer(unlist(strsplit(im, " "))) }

d.test$Image <-NULL

coord <- "left_eye_center"
patch_size <- 10

coord_x <- paste(coord, "x", sep="_")
coord_y <- paste(coord, "y", sep="_")
patches <- foreach (i = 1:nrow(d.train), .combine=rbind) %do% { 
	im <-matrix(data = im.train[i], nrow=96, ncol=96)
	x <- d.train[i, coord_x]
	y <-d.train[i, coord_y]
	x1 <-(x-patch_size)
	y1 <- (y-patch_size)
	x2 <- (x+patch_size)
	y2 <- (y + patch_size)
	
	# look at space around the left_eye_center
	if( (!is.na(x)) && (x1 >= 1) && (x2 <= 96) && (y1 >= 1) && (y2 <=96)) 
	 { 
		as.vector(im[x1:x2, y1:y2])
	 }else { 
 		NULL
	}
}
# get the average intensity of the pixels for a patch (produces average eye)

mean.patch <- matrix(data = colMeans(patches), nrow=2*patch_size + 1, ncol = 2*patch_size + 1)




