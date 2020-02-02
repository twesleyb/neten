#' Length
#'
#' R implementation of Network Enhacement
#'
#' @param dm - input matrix
#'
#' @return largest dimension of a matrix
#'
#' @author microbma, \github{https://github.com/microbma}
#' @author Tyler Bradshaw, \github{https://github.com/twesleyb}
#'
#' @references \href{https://bit.ly/2RS5pLX}{Wang, Pourshafeie, Zitnik, et al., 2018}
#'
#' @keywords network enhancement
#'
#' @export
Length <- function(dm) {
  return(max(dim(dm)))
}
