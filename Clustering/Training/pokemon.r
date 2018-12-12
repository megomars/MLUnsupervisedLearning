install.packages("readr")
library("readr")
setwd("~/Google Drive/2018Code/R/PersonaAnalysis/Clustering/Training")

pdata <- read_csv("pokemon.csv")
head(pdata)
colnames(pdata)
pdata <- pdata[5:11]


################################### KMEANS
#Run the kmeans algorithm with 3 clusters
kdata <- kmeans(pdata, 3, nstart=50)
summary(kdata)


#how many clusters should we really have?
wss <- 0
for (i in 1:15){
  kdata <- kmeans(pdata, i, nstart = 20, iter.max = 50)
  wss[i] <- kdata$tot.withinss
}
plot(1:15, wss, type = "b", 
     xlab = "Number of Clusters", 
     ylab = "Within groups sum of squares")

#The scree plot tells us we should have 3 (that's where the elbow bends)

kdata <- kmeans(pdata, centers = 3, nstart = 20, iter.max = 50)

# Plot of Defense vs. Speed by cluster membership
plot(pdata[, c("Defense", "Speed")],
     col = kdata$cluster,
     main = paste("k-means clustering of Pokemon with", 3, "clusters"),
     xlab = "Defense", ylab = "Speed")





################################### HCLUST

#Calculate the distance between 2 values
# dist_matrix <- dist(x)
# hclust(d=dist_matrix)

# hclust(d=s)