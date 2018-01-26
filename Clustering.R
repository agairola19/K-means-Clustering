#2.3 Clusteriing

library(cluster)
library(factoextra)


#(a) Data Cleanup

#(iii)
trans <- read.csv(file = "file19.txt",comment.char = "#",sep = "", header= T)
write.csv(trans, file = 'Mammals.csv', sep=",", col.names = T )
cleaned.trans <- read.csv("Mammals.csv",comment.char="#")

#(i)
#first column is serial number, we can remove it
cleaned.trans<-cleaned.trans[,-1]

#(ii)There is no need to perform Standardization 


#(b)Clustering

#(i)
# Elbow method minimizes total within-cluster sum of squares (wss).Also called a "Scree" plot.
# According to graph, After cluster number 7, slope becomes constant.
# Hence number of clusters = 7
fviz_nbclust(cleaned.trans[2:9], kmeans, method="wss") 

# Silhouette measures the quality of a cluster
fviz_nbclust(cleaned.trans[2:9], kmeans, method="silhouette")


#(ii) Running K means clustering
k <- kmeans(cleaned.trans[2:9], centers=7, nstart=25)

#(iii) Number of observation in each cluster
k$size

#(iv) Total SSE of clusters
k$tot.withinss

#(v) SSE of each Cluter
k$withinss

#(vi)
which(k$cluster ==1)

which(k$cluster ==2)

which(k$cluster ==3)

which(k$cluster ==4)

which(k$cluster ==5)

which(k$cluster ==6)

which(k$cluster ==7)