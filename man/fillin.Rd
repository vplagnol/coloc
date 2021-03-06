\name{fillin}
\alias{fillin}
\title{Impute missing genotypes}
\usage{
  fillin(X, bp = 1:ncol(X), strata = NULL)
}
\arguments{
  \item{X}{a snpMatrix object}

  \item{bp}{optional vector giving basepair positions of
  the SNPs}

  \item{strata}{optional vector giving stratificiation of
  the samples, one entry for each sample, and samples with
  the same value are assumed to come from a single strata}
}
\value{
  a numeric matrix of imputed genotypes, 0,2 = homs, 1 =
  het
}
\description{
  Impute missing genotypes in a snpMatrix object in each
  SNP in turn, conditional on all the others.
}

