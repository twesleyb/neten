#' NE_dn
#'
#' R implementation of Network Enhancement
#'
#' @param w - input weighted N x N adjacency matrix
#'
#' @param type - normalization method to be used.
#'
#' @return normalized adjacency matrix
#'
#' @author Bo Wang, \github{https://github.com/wangboyunze}
#' @author microbma, \github{https://github.com/microbma}
#' @author Tyler Bradshaw, \github{https://github.com/twesleyb}
#'
#' @references \href{https://bit.ly/2RS5pLX}{Wang, Pourshafeie, Zitnik, et al., 2018}
#'
#' @keywords network enhancement
#'
#' @export
NE_dn <- function(w, type) {
  source("Length.R")
  eps <- 2e-16
  w <- w * Length(w)
  D <- rowSums(abs(w)) + eps
  if (type == "ave") {
    D <- 1 / D
    D <- diag(D)
    wn <- D %*% w
  } else if (type == "gph") {
    D <- 1 / sqrt(D)
    D <- diag(D)
    wn <- D %*% w %*% D
  }
  return(wn)
}
