% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eclust.R
\name{eclust}
\alias{eclust}
\title{Visual enhancement of clustering analysis}
\usage{
eclust(x, FUNcluster = c("kmeans", "pam", "clara", "fanny", "hclust", "agnes",
  "diana"), k = NULL, k.max = 10, stand = FALSE, graph = TRUE,
  hc_metric = "euclidean", hc_method = "ward.D2", gap_maxSE = list(method
  = "firstSEmax", SE.factor = 1), nboot = 100, verbose = interactive(),
  seed = 123, ...)
}
\arguments{
\item{x}{numeric vector, data matrix or data frame}

\item{FUNcluster}{a clustering function including "kmeans", "pam", "clara", 
"fanny", "hclust", "agnes" and "diana". Abbreviation is allowed.}

\item{k}{the number of clusters to be generated. If NULL, the gap statistic 
is used to estimate the appropriate number of clusters. In the case of 
kmeans, k can be either the number of clusters, or a set of initial 
(distinct) cluster centers.}

\item{k.max}{the maximum number of clusters to consider, must be at least 
two.}

\item{stand}{logical value; default is FALSE. If TRUE, then the data will be 
standardized using the function scale(). Measurements are standardized for 
each variable (column), by subtracting the variable's mean value and 
dividing by the variable's standard deviation.}

\item{graph}{logical value. If TRUE, cluster plot is displayed.}

\item{hc_metric}{character string specifying the metric to be used for 
calculating dissimilarities between observations. Allowed values are those 
accepted by the function dist() [including "euclidean", "manhattan", 
"maximum", "canberra", "binary", "minkowski"] and correlation based 
distance measures ["pearson", "spearman" or "kendall"]. Used only when 
FUNcluster is a hierarchical clustering function such as one of "hclust", 
"agnes" or "diana".}

\item{hc_method}{the agglomeration method to be used (?hclust): "ward.D", 
"ward.D2", "single", "complete", "average", ...}

\item{gap_maxSE}{a list containing the parameters (method and SE.factor) for 
determining the location of the maximum of the gap statistic (Read the 
documentation ?cluster::maxSE).}

\item{nboot}{integer, number of Monte Carlo ("bootstrap") samples. Used only 
for determining the number of clusters using gap statistic.}

\item{verbose}{logical value. If TRUE, the result of progress is printed.}

\item{seed}{integer used for seeding the random number generator.}

\item{...}{other arguments to be passed to FUNcluster.}
}
\value{
Returns an object of class "eclust" containing the result of the 
  standard function used (e.g., kmeans, pam, hclust, agnes, diana, etc.).
  
  It includes also: \itemize{ \item cluster: the cluster assignement of 
  observations after cutting the tree \item nbclust: the number of clusters 
  \item silinfo: the silhouette information of observations, including 
  $widths (silhouette width values of each observation), $clus.avg.widths 
  (average silhouette width of each cluster) and $avg.width (average width of
  all clusters) \item size: the size of clusters \item data: a matrix 
  containing the original or the standardized data (if stand = TRUE) } The 
  "eclust" class has method for fviz_silhouette(), fviz_dend(), 
  fviz_cluster().
}
\description{
Provides solution for enhancing the workflow of clustering
  analyses and ggplot2-based elegant data visualization. Read more: 
 \href{http://www.sthda.com/english/wiki/visual-enhancement-of-clustering-analysis-unsupervised-machine-learning}{Visual enhancement of clustering analysis}.
}
\examples{
# Load and scale data
data("USArrests")
df <- scale(USArrests)

# Enhanced k-means clustering
res.km <- eclust(df, "kmeans", nboot = 10)
# Silhouette plot
fviz_silhouette(res.km)
# Optimal number of clusters using gap statistics
res.km$nbclust
# Print result
 res.km
 
 # Enhanced hierarchical clustering
 res.hc <- eclust(df, "hclust", nboot = 10) # compute hclust
  fviz_dend(res.hc) # dendrogam
  fviz_silhouette(res.hc) # silhouette plot
 
}
\seealso{
\code{\link{fviz_silhouette}}, \code{\link{fviz_dend}}, 
  \code{\link{fviz_cluster}}
}
\author{
Alboukadel Kassambara \email{alboukadel.kassambara@gmail.com}
}
