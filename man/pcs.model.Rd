\name{pcs.model}
\alias{pcs.model}
\title{Functions to prepare principle component models for colocalisation testing}
\usage{
  pcs.model(object, group, Y, threshold = 0.8,
    family = if (all(Y \%in\% c(0, 1))) {     "binomial"
    } else {     "gaussian" })
}
\arguments{
  \item{object}{A colocPCs object, result of
  \code{pcs.prepare()}.}

  \item{group}{1 or 2, indicating which group of samples to
  extract from principal components matrix}

  \item{Y}{Numeric phenotype vector, length equal to the
  number of samples from the requested group}

  \item{threshold}{The minimum number of principal
  components which captures at least threshold proportion
  of the variance will be selected.  Simulations suggest
  \code{threshold=0.8} is a good default value.}

  \item{family}{Passed to \code{glm()} function.
  \code{pcs.model} attempts to guess, either "binomial" if
  \code{Y} contains only 0s and 1s, "gaussian" otherwise.}
}
\value{
  \code{pcs.prepare} returns a \code{colocPCs} object.

  \code{pcs.model} returns a \code{glm} object.
}
\description{
  Prepares models of response based on principal components
  of two datasets for colocalisation testing.
}
\examples{
## simulate covariate matrix (X) and continuous response vector (Y)
 ## for two populations/triats Y1 and Y2 depend equally on f1 and f2
 ## within each population, although their distributions differ between
 ## populations.  They are compatible with a null hypothesis that they
 ## share a common causal variant, with the effect twice as strong for
 ## Y2 as Y1
set.seed(1)
 X1 <- matrix(rbinom(5000,1,0.4),ncol=10)
 Y1 <- rnorm(500,apply(X1[,1:2],1,sum),2)
 X2 <- matrix(rbinom(5000,1,0.6),ncol=10)
 Y2 <- rnorm(500,2*apply(X2[,1:2],1,sum),5)

 ## generate principal components object
 colnames(X1) <- colnames(X2) <- make.names(1:ncol(X1))
 pcs <- pcs.prepare(X1,X2)

 ## generate glm objects
 m1 <- pcs.model(pcs, group=1, Y=Y1)
 m2 <- pcs.model(pcs, group=2, Y=Y2)

 ## test colocalisation using PCs
 coloc.test(m1,m2,plot.coeff=FALSE,bayes=FALSE)
}
\author{
  Chris Wallace
}
\references{
  Wallace et al (2012).  Statistical colocalisation of
  monocyte gene expression and genetic risk variants for
  type 1 diabetes.  Hum Mol Genet 21:2815-2824.
  \url{http://europepmc.org/abstract/MED/22403184}

  Plagnol et al (2009).  Statistical independence of the
  colocalized association signals for type 1 diabetes and
  RPS26 gene expression on chromosome 12q13. Biostatistics
  10:327-34.
  \url{http://www.ncbi.nlm.nih.gov/pubmed/19039033}
}

