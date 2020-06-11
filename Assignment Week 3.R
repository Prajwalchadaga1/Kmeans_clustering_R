library(datasets)
libraries = read.csv(file = 'libraries.csv')
head(libraries)
library(ggplot2)
ggplot(libraries,aes(Visits.per.capita, Walking.minutes, Noise.restrictions, Onsite.Coffee, color=Library)) + geom_point()
set.seed(20)
librariesCluster = kmeans(libraries[,2:5], 4, nstart = 20)
librariesCluster
table(libraries$Library, librariesCluster$cluster)
ggplot(libraries,aes(Visits.per.capita, Walking.minutes, Noise.restrictions, Onsite.Coffee, color=librariesCluster$cluster)) + geom_point()
library(factoextra)
library(cluster)
fviz_nbclust(libraries[,2:5], FUN = kmeans, method = "silhouette")

sil <- silhouette(librariesCluster$cluster, dist(libraries))
fviz_silhouette(sil)

librariesCluster = kmeans(libraries[,2:5], 3, nstart = 20)
librariesCluster
ggplot(libraries,aes(Visits.per.capita, Walking.minutes, Noise.restrictions, Onsite.Coffee, color=librariesCluster$cluster)) + geom_point()

sil <- silhouette(librariesCluster$cluster, dist(libraries))
fviz_silhouette(sil)


librariesCluster = kmeans(libraries[,2:5], 2, nstart = 20)
librariesCluster

sil <- silhouette(librariesCluster$cluster, dist(libraries))
fviz_silhouette(sil)

librariesCluster = kmeans(libraries[,2:5], 4, nstart = 20)
librariesCluster

sil <- silhouette(librariesCluster$cluster, dist(libraries))
fviz_silhouette(sil)