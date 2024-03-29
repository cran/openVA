% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/interVA.train.r
\name{interVA_train}
\alias{interVA_train}
\title{Extended InterVA method for non-standard input}
\usage{
interVA_train(
  data,
  train,
  causes.train,
  causes.table = NULL,
  thre = 0.95,
  type = c("quantile", "fixed", "empirical")[1],
  prior = c("uniform", "train")[1],
  ...
)
}
\arguments{
\item{data}{A matrix input, or data read from csv files. Sample input is included as \code{data(RandomVA3)}.}

\item{train}{A matrix input, or data read from csv files in the same format
as \code{data}, but with an additional column specifying cause-of-death. Sample input is included as \code{data(RandomVA3)}.}

\item{causes.train}{the column name of the cause-of-death assignment label in training data.}

\item{causes.table}{list of causes to consider in the training data. Default to be NULL, which uses all the causes present in the training data.}

\item{thre}{numerical number between 0 and 1. Symptoms with missing rate higher than \code{thre} in the training data will be dropped from both training and testing data.}

\item{type}{type of data conversion when calculating conditional probability (probability of each symptom given each cause of death) for InterVA and InSilicoVA models. Both ``quantile'' and ``fixed'' usually give similar results empirically. 
\itemize{
\item \code{quantile}: the rankings of the P(S|C) are obtained by matching the same quantile distributions in the default InterVA P(S|C)
\item \code{fixed}: P(S|C) are matched to the closest values in the default InterVA P(S|C) table.
\item \code{empirical}: no ranking is calculated, but use the empirical conditional probabilities directly.
}}

\item{prior}{The prior distribution of CSMF. ``uniform'' uses no prior information, i.e., 1/C for all C causes and ``train'' uses the CSMF in the training data as prior distribution of CSMF.}

\item{...}{not used}
}
\value{
fitted \code{interVA} object
}
\description{
Extended InterVA method for non-standard input
}
\examples{
\donttest{
data(RandomVA3)
test <- RandomVA3[1:200, ]
train <- RandomVA3[201:400, ]
out <- interVA_train(data = test, train = train, causes.train = "cause", 
                     prior = "train", type = "quantile")
}
}
\references{
Tyler H. McCormick, Zehang R. Li, Clara Calvert, Amelia C.
Crampin, Kathleen Kahn and Samuel J. Clark (2016) \emph{Probabilistic
cause-of-death assignment using verbal autopsies.}
\url{https://arxiv.org/abs/1411.3042}, \emph{To appear, Journal of the American Statistical Association}

Zehang R. Li, Tyler H. McCormick, Samuel J. Clark (2014) \emph{InterVA4: An R package to analyze verbal autopsy data.}, \emph{Center for Statistics and the Social Sciences Working Paper, No.146}

http://www.interva.net/
}
\keyword{InterVA4}
