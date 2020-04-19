\name{UASS}
\alias{UASS}
\docType{data}
\title{
Speciated Arsenics - Urine - Special Sample (UASS)
}
\description{
Arsenic is widely distributed in the earth’s crust and is found most often in ground water rather than surface water. People encounter arsenic in many chemical forms that vary greatly in toxicity. The most toxic of the naturally occurring arsenic compounds are inorganic forms of arsenic and their methylated metabolites. Less toxic are the organic arsenic compounds.

Participants aged 18 years and older, who met the regular one-third subsample selection criteria, were included in this special subsample. Additionally, to oversample adult smokers, those participants aged 18 years and older, not in the regular one-third subsample, who smoked at least 100 cigarettes in their entire lifetime (SMQ020=1) and now smoke cigarettes every day (SMQ040=1), were also included in this special subsample.
}
\usage{data("UASS")}
\format{
  A data frame with 2462 observations on 14 variables. Among the observations, 74 individuals did not pass sample eligibility and so the values are missing. So, effective sample size is 2,388. For each type of arsenic measures thera are two variables one for original measure and another to indicate if the actual value was bellow the lower limit. The indicator variables are the one with 'LC' at the end of the original variable names. \code{*LC} = 1 if the value was at or above the lower limit and zero otherwise.   
  \describe{
  \item{\code{SEQN}}{Individual ID}
  \item{\code{WTFSM}}{Two year smoking weights}
  \item{\code{URXUAS3}}{Urinary Arsenous Acid. Lower Limit: 0.12}
  \item{\code{URXUAS5}}{Urinary Arsenic acid. Lower Limit: 0.79}
  \item{\code{URXUAB}}{Urinary Arsenobetaine. Lower Limit: 1.16}
  \item{\code{URXUAC}}{Urinary Arsenocholine. Lower Limit: 0.11}
  \item{\code{URXUDMA}}{Urinary Dimethylarsinic Acid. Lower Limit: 1.91}
  \item{\code{URXUMMA}}{Urinary Monomethylarsonic Acid. Lower Limit: 0.20}
  }
}
\details{
  A details can be found at https://wwwn.cdc.gov/Nchs/Nhanes/2015-2016/UASS_I.htm
}
\source{
 CDC
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(UASS)

}
\keyword{datasets}
