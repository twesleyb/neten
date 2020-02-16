def Network_Enhancement(W_in,order=2,K,alpha=0.9):
    pass

def is_symmetric(adjm):
    return(len(set(adjm.shape)) == 1)

# EPS
import numpy as np
eps = np.finfo(float).eps

# Import test data.
from pandas import read_csv
adjm_input = read_csv('butterfly.csv',index_col=0)

# Remove diagonal.
from numpy import eye
adjm = adjm_input * (1 - eye(max(adjm.shape)))

# Keep colums whose sum is greater than 0.
idy = adjm.sum(axis=1) > 0
adjm = adjm[idy]

# Perform normalization step.
from numpy import sqrt
from numpy import matmul
from numpy import fill_diagonal
# Multiple the values of the matrix by the number of nodes.
adjm_norm = adjm * max(adjm.shape)
# Row sums + eps. == Abs Degree centrality.
rowSums = abs(adjm_norm).sum(0) + eps
# Inverse of Degree centrality. --> Identity matrix.
D = eye(len(rowSums))
fill_diagonal(D, 1 / rowSums)
adjm_norm = matmul(D,adjm_norm)

# Continue with main script.
W = (Ddot + Ddot.transpose())/2  
DD = abs(adjm).sum(1)


from numpy import unique
if len(unique(W)) == 2:
    P = W
else:
    ## Dominateset function....
    #P = dominateset(abs(W),min(k,Length(W)-1)) * sign(W)))
# FOO

def dominateset():
    pass




