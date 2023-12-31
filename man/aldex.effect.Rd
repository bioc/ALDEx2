% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clr_effect.r
\name{aldex.effect}
\alias{aldex.effect}
\title{Calculate effect sizes and differences between conditions}
\usage{
aldex.effect(
  clr,
  verbose = TRUE,
  include.sample.summary = FALSE,
  useMC = FALSE,
  CI = FALSE,
  glm.conds = NULL,
  paired.test = FALSE
)
}
\arguments{
\item{clr}{\code{clr} is the data output of \code{aldex.clr}.}

\item{verbose}{Print diagnostic information while running. Useful only for debugging if fails on large datasets.}

\item{include.sample.summary}{Include median clr values for each sample, defaults to FALSE.}

\item{useMC}{Use multicore by default (FALSE).}

\item{CI}{Give effect 95\% confidence intervals, defaults to FALSE.}

\item{glm.conds}{Give effect for glm contrasts, note: saved as list.}

\item{paired.test}{Calculate effect size for paired samples, defaults to FALSE.}
}
\value{
Returns a dataframe with the following information:
 \item{rab.all}{a vector containing the median clr value for each feature.}
 \item{rab.win.conditionA}{a vector containing the median clr value for each feature in condition A.}
 \item{rab.win.conditionB}{a vector containing the median clr value for each feature in condition B.}
 \item{diff.btw}{a vector containing the per-feature median difference between condition A and B.}
 \item{diff.win}{a vector containing the per-feature maximum median difference between 
   Dirichlet instances within conditions.}
 \item{effect}{a vector containing the per-feature effect size.}
 \item{overlap}{a vector containing the per-feature proportion of effect size that is 0 or less.}
}
\description{
Determines the median clr abundance of the feature in all samples and in groups.
Determines the median difference between the two groups.
Determines the median variation within each two group.
Determines the effect size, which is the median of the ratio of the 
 between-group difference and the larger of the variance within groups.
}
\details{
An explicit example for two conditions is shown in the `Examples` below.
}
\examples{
# x is the output of the \code{x <- clr(data, mc.samples)} function
# conditions is a description of the data
# for the selex dataset, conditions <- c(rep("N", 7), rep("S", 7))
data(selex)
# subset for efficiency
selex <- selex[1201:1600,]
conds <- c(rep("NS", 7), rep("S", 7))
x <- aldex.clr(selex, conds, mc.samples=2, denom="all")
effect.test <- aldex.effect(x)

}
\references{
Please use the citation given by \code{citation(package="ALDEx")}.
}
\seealso{
\code{\link{aldex.clr}}, \code{\link{aldex.ttest}}, \code{\link{aldex.glm}}, 
  \code{\link{aldex.glm.effect}}, \code{\link{selex}}
}
\author{
Greg Gloor, Andrew Fernandes, Matt Links
}
