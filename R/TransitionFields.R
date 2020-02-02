#' TransitionFields
#'
#' R implementation of Network Enhancement
#'
#' @param w - input weighted N x N adjacency matrix
#'
#' @param diffusion - the extent of diffusion
#'
#' @return re-weighted N x N adjacency matrix.
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
TransitionFields <- function(W) {
  source("Length.R")
  eps <- 2e-16
  zeroindex <- which(rowSums(W) == 0)
  W <- W * Length(W)
  W <- NE_dn(W, "ave")
  W <- apply(W, 2, function(x) x / sqrt(sum(abs(x)) + eps))
  W <- tcrossprod(W)
  Wnew <- W
  Wnew[zeroindex, ] <- 0
  Wnew[, zeroindex] <- 0
  return(Wnew)
}
