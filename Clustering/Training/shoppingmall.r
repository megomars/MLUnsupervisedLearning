# V1	Shopping is fun	1-7
# V2	Shopping is bad for your budget	1-7
# V3	I combine shopping with eating out	1-7
# V4	I try to get the best buys while shopping	1-7
# V5	I don???t care about shopping	1-7
# V6	You can save lot of money by comparing prices	1-7
# Income	The household income of the respondent	Dollars
# Mall.Visits	How often they visit the mall	1-7

library(datapasta)
library(tibble)

data <-tibble::tribble(
  ~V1, ~V2, ~V3, ~V4, ~V5, ~V6, ~V7,   ~V8, ~V9,
    1,   6,   4,   7,   3,   2,   3, 60000,   3,
    2,   2,   3,   1,   4,   5,   4, 30000,   1,
    3,   7,   2,   6,   4,   1,   3, 70000,   3,
    4,   4,   6,   4,   5,   3,   6, 30000,   7,
    5,   1,   3,   2,   2,   6,   4, 60000,   1,
    6,   6,   4,   6,   3,   3,   4, 50000,   2,
    7,   5,   3,   6,   3,   3,   4, 65000,   3,
    8,   7,   3,   7,   4,   1,   4, 55000,   4,
    9,   2,   4,   3,   3,   6,   3, 70000,   0,
   10,   3,   5,   3,   6,   4,   6, 25000,   6
  )
names(data) <- c("id", "V1", "V2", "V3", "V4", "V5", "V6", "income", "visits")

summary(data)
# STEPS TO FOLLOW
# 1. Confirm data is metric - CHECKED
# 2. Scale the data
# 3. Select Segmentation Variables
# 4. Define similarity measure
# 5. Visualize Pair-wise Distances
# 6. Method and Number of Segments
# 7. Profile and interpret the segments
# 8. Robustness Analysis

# https://inseaddataanalytics.github.io/INSEADAnalytics/CourseSessions/Sessions45/ClusterAnalysisReading.html
# https://datascience.stackexchange.com/questions/19748/using-machine-learning-to-create-marketing-segments
# https://rpubs.com/jimu_xw/market_segmentation
# https://ds4ci.files.wordpress.com/2013/09/user08_jimp_custseg_revnov08.pdf
# https://towardsdatascience.com/how-to-cluster-your-customer-data-with-r-code-examples-6c7e4aa6c5b1
# https://josepcurtodiaz.gitbooks.io/customer-analytics-with-r/content/chapter7.html
# https://www.slideshare.net/JimPorzak/user2015-jporzak-customersegmentation20150701

