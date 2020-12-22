#' Length
#'
#' R implementation of matlab's length function
#'
#' @param dm - input matrix
#'
#' @return largest dimension of a matrix
#'
#' @author microbma, \href{https://github.com/microbma}{github}
#' @author Tyler Bradshaw, \href{https://github.com/twesleyb}{github}
#'
#' @references \href{https://bit.ly/2RS5pLX}{Wang, Pourshafeie, Zitnik, et al., 2018}
#'
#' @keywords network enhancement
#'
#' @export
Length <- function(dm) {
  return(max(dim(dm)))
}
