#' neten
#'
#' R implementation of Network Enhancement
#'
#' @export neten
#'
#' @param W_in - input weighted N x N adjacency matrix
#'
#' @param alpha - regularization parameter
#'
#' @param diffusion - diffusion parameter, typical values are 0.5, 1.0, 1.2, 2.0
#'
#' @param k - number of neighbors, if NULL then defaults to ceil(20,ncol(data))
#'
#' @return re-weighted N x N adjacency matrix
#'
#' @author Bo Wang, \href{https://github.com/wangboyunze}{github}
#'
#' @author microbma, \href{https://github.com/microbma}{github}
#'
#' @author Tyler Bradshaw, \href{https://github.com/twesleyb}{github}
#'
#' @references \href{https://bit.ly/2RS5pLX}{Wang et al., 2018}
#'
#' @keywords network enhancement
#'
#' @examples
#' library(neten)
#' data(butterfly)
#' neten(butterfly)

neten <- function(W_in, alpha = 0.9, diffusion = 2, k = NULL) {

  # input should be a matrix
  if (!is.matrix(W_in)) {
    W_in <- as.matrix(W_in)
  }

  # input should be symmetric
  symmetric <- dim(W_in)[1] == dim(W_in)[2]
  if (!symmetric) {
    stop("Input matrix must be symmetric.")
  }

  # get matrix names
  nodes <- colnames(W_in)
  # Default k.
  if (is.null(k)) {
    k <- min(20, ceiling(Length(W_in) / 10))
  }

  # default eps
  eps <- 2e-16

  # Identity matrix:
  W_in1 <- W_in * (1 - diag(Length(W_in)))
  zeroindex <- which(colSums(abs(W_in)) > 0)
  W0 <- W_in[zeroindex, zeroindex]
  W <- NE_dn(W0)
  W <- (W + t(W)) / 2
  DD <- colSums(abs(W0))

  if (length(unique(as.vector(W))) == 2) {
    P <- W
  } else {
    P <- dominateset(abs(W), min(k, Length(W) - 1)) * sign(W)
  }

  P <- P + (diag(Length(P)) + diag(rowSums(abs(P))))
  P <- TransitionFields(P)
  eig <- eigen(P)
  U <- eig$vectors
  d <- eig$values - eps
  d <- (1 - alpha) * d / (1 - alpha * d^diffusion)
  D <- diag(d)
  W <- U %*% D %*% t(U)
  W <- W * (1 - diag(Length(W))) / (1 - diag(W))
  D <- diag(DD)
  W <- D %*% W
  W[W < 0] <- 0
  W <- (W + t(W)) / 2
  W_out <- matrix(0, nrow = nrow(W_in), ncol = ncol(W_in))
  W_out[zeroindex, zeroindex] <- W
  colnames(W_out) <- rownames(W_out) <- nodes

  return(W_out)
} #EOF
