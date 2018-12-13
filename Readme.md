# Cluster Analysis

Cluster analysis is a form of exploratory data analysis (EDA) which involves grouping observations that share similar characteristics. This is done primarily by measuring the distance between observations. Cluster Analysis is an application of unsupervised machine learning where no training data is provided. Commonly used algorithms for clustering include: kmeans, mean-shift, dbscan, GMM and Hierarchical clustering.

What kinds of problems are suitable for cluster analysis?
- Using consumer behavior data to identify distinct segments within a market.
- Identifying distinct groups of stocks that follow similar trading patterns.

## Theory

Distance = 1-Similarity
The goal is to maximize BSS (betweeness) and minimize TWSS (total)


Before getting started we first need to make sure that we standardise of measurements.

## Pre-processing
- No missing values
- Features have similar scales
- Calculate distances

### Calculate a standardised scale (if measurements are meters and kilograms)
```{R}
scale(height_weight) #standardises to a mean of 0 and sd of 1
```

### Calculate the distance (between continuous variables)
```{R}
dist(two_players, method = "euclidean")
```

### Calculate the distance (between 2 categorical variables)
```{R}
dist(survey_a, method = "binary")
```
![Jaccard index](jaccard.png)


### Calculate the distance (between 3 or more categorical variables)
#### We first have to dummify our data
```{R}
library(dummies)
dummy.data.frame(survey_b)
dist(survey_a, method = "binary")
```

## Which features to use

## Clustering method

### Hierarchical
```{R}
# Here we have continuous data which is already standardised

dist_players <- dist(players, method="euclidean")
hc_player <- hclust(dist_players, method="complete")

output <- cuttree(hc_player, k=2)
output # a vector which tells us where each observation belongs e.g.
# 1 1 1 1 2 2

# Append back to original data 
players_clustered <- mutate(players, group = output)

# we can now plot them
ggplot(players_clustered, aes(x=x, y=y, color=factor(cluster)))+ geom_point()
```
![results of cluster](soccer.png)

## Analyze the output for meaning
Make sure you understand the problem really well.






#scale

kmeans(x,4,nstart=20)
