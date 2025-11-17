# Example 1 Principal Components Analysis

states <- row.names(USArrests)
View(USArrests)
fix(USArrests)
cor(USArrests)
###
names(USArrests)
###
apply(USArrests, 2, mean)
###

apply(USArrests, 2, var)

###

pr.out <- prcomp(USArrests, scale = TRUE)

###

names(pr.out)
summary(pr.out)

###

pr.out$center
pr.out$scale

###

pr.out$rotation

###

dim(pr.out$x)

###

biplot(pr.out, scale = 0,cex=0.8)

###

pr.out$rotation = -pr.out$rotation
pr.out$x = -pr.out$x
biplot(pr.out, scale = 0,cex=0.6)

###

pr.out$sdev

###

pr.var <- pr.out$sdev^2
pr.var

###

pve <- pr.var / sum(pr.var)
pve

###

par(mfrow = c(1, 2))
plot(pve, xlab = "Principal Component",
     ylab = "Proportion of Variance Explained", ylim = c(0, 1),
     type = "b")
plot(cumsum(pve), xlab = "Principal Component",
     ylab = "Cumulative Proportion of Variance Explained",
     ylim = c(0, 1), type = "b")

### Example 2 
### K-Means Clustering
set.seed(2)
x <- matrix(rnorm(50 * 2), ncol = 2)
x[1:25, 1] <- x[1:25, 1] + 3
x[1:25, 2] <- x[1:25, 2] - 4
###
km.out <- kmeans(x, 2, nstart = 20)
###
names(km.out)
km.out$cluster
###
par(mfrow = c(1, 2))
plot(x, col = (km.out$cluster + 1),
     main = "K-Means Clustering Results with K = 2",
     xlab = "", ylab = "", pch = 20, cex = 2)
###
set.seed(4)
km.out <- kmeans(x, 3, nstart = 20)
km.out$cluster
plot(x, col = (km.out$cluster + 1),
     main = "K-Means Clustering Results with K = 3",
     xlab = "", ylab = "", pch = 20, cex = 2)
###
set.seed(4)
km.out <- kmeans(x, 3, nstart = 1)
km.out$tot.withinss
km.out$withinss

km.out <- kmeans(x, 3, nstart = 20)
km.out$tot.withinss

### Hierarchical Clustering

###
hc.complete <- hclust(dist(x), method = "complete")
names(hc.complete)
###
hc.average <- hclust(dist(x), method = "average")
hc.single <- hclust(dist(x), method = "single")
###
par(mfrow = c(1, 1))
plot(hc.complete, main = "Complete Linkage",
     xlab = "", sub = "", cex = .9)
plot(hc.average, main = "Average Linkage",
     xlab = "", sub = "", cex = .9)
plot(hc.single, main = "Single Linkage",
     xlab = "", sub = "", cex = .9)
abline(h=c(1.33,1.1),col=c('red','blue'),type='dotted')
###
(cutree(hc.complete, 3))
cutree(hc.average, 2)
cutree(hc.single, 2)
###
cutree(hc.single, 3)
###
xsc <- scale(x)
plot(hclust(dist(xsc), method = "complete"),
     main = "Hierarchical Clustering with Scaled Features")

