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

two_players <- data.frame(c(0,9),c(0,12))
names(two_players) <- c("name1", "name2")
two_players
dist_matrix <- dist(two_players, method = "euclidean")
dist_matrix
hclust(d=dist_matrix)

# hclust(d=s)



############################# SCALE YOUR VALUES
dist_trees <- dist(three_trees)
# Scale three trees & calculate the distance  
scaled_three_trees <- scale(three_trees)
dist_scaled_trees <- dist(scaled_three_trees)


############################# Categorical data ---- METHOD = "BINARY"
df <- data.frame(c(TRUE, FALSE, TRUE),c(TRUE, TRUE, FALSE),c(FALSE, TRUE, TRUE), c(FALSE, TRUE, FALSE))
df
names(df)<- c("wine","beer","whiskey","vodka")
dist (df, method="binary")


############################# DUMIFICATION - Multiple categorical values

install.packages("dummies")
library(dummies)

du <- data.frame(c("red","green","blue","blue"),c("soccer", "hockey", "hockey", "soccer"))
names(du) <- c("color","sport")
du

dummy_du <- dummy.data.frame(du)
dist(dummy_du, method="binary")


# Dummify the Survey Data
library(dummies)
dummy_survey <- dummy.data.frame(job_survey)

job_survey

# Calculate the Distance
dist_survey <- dist(dummy_survey, method="binary")

# Print the Original Data
job_survey

# Print the Distance Matrix
dist_survey



xf <- data.frame(c(-1,-2,8,7,-12,-15),c(1,-3,6,-8,8,0))
xf
names(xf) <- c("x","y")
xf

dp <- dist(xf, method="euclidean")
hc_player <- hclust(dp, method="complete")

hc_player
cuttree(hc_player, k=2)
