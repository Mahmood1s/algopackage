\name{lab3algopackage-package}
\alias{lab3algopackage-package}
\alias{lab3algopackage}
\docType{package}
\title{
\packageTitle{lab3algopackage}
}
\description{
\packageDescription{lab3algopackage}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{lab3algopackage}
\packageIndices{lab3algopackage}
~~ this package is calculating Euclidean (GCD) of two numbers and Dijkstra (SPF) from given node~~
}
\author{
\packageAuthor{lab3algopackage}

Maintainer: \packageMaintainer{lab3algopackage}
}
\references{
~~ https://en.wikipedia.org/wiki/Dijkstra's_algorithm ~~
~~ https://en.wikipedia.org/wiki/Euclidean_algorithm ~~
}

\examples{
 \dontrun{
v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6)
v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5)
w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9)
wiki_graph <-data.frame(v1,v2,w)
dijkstra(wiki_graph, 1)
dijkstra(wiki_graph, 3)
}
}
