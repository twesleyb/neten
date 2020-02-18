def Network_Enhancement(W_in,order=2,K,alpha=0.9):
    pass

def is_symmetric(adjm):
    return(len(set(adjm.shape)) == 1)

# Import test data.
from pandas import read_csv
adjm_input = read_csv('butterfly.csv',index_col=0)

# Define default k.
from math import ceil
if k is None:
    k = min(20,ceil(max(adjm_input.shape)/10))
# Define default EPS.
import numpy as np
eps = np.finfo(float).eps

# Remove diagonal.
from numpy import eye
adjm = adjm_input * (1 - eye(max(adjm_input.shape)))
# Keep colums whose sum is greater than 0.
idy = adjm.sum(axis=1) > 0
subadjm = adjm[idy]
# Perform normalization step.
from numpy import sqrt
from numpy import matmul
from numpy import fill_diagonal
# Multiple the values of the matrix by the number of nodes.
adjm_norm = subadjm * max(subadjm.shape)
# Row sums + eps. 
rowSums = abs(adjm_norm).sum(0) + eps
# Inverse of Degree centrality. --> Identity matrix.
D = eye(len(rowSums))
fill_diagonal(D, 1 / rowSums)
adjm_norm = matmul(D,adjm_norm)
# Continue with main script.
W = (adjm_norm + adjm_norm.transpose())/2  
DD = abs(W).sum(1)

from numpy import unique
if len(unique(W)) == 2:
    P = W
else:
    ## Dominateset function....
    #P = dominateset(abs(W),min(k,Length(W)-1)) * sign(W)))

def dominateset():
    pass

# Sort each row in descending order...
A,B = sort_rows(abs(W).values,indices=True,decreasing=True)

def sort_rows(Array,indices=False,decreasing=False):
    # Sort rows of a numpy array.
    from numpy import array
    from numpy import sort
    if not decreasing:
        # Sort rows in increasing order.
        Indices = Array.argsort()
        Array = sort(Array,axis=-1)
    elif decreasing:
        # Sort rows in decreasing order.
        n = range(Array.shape[0])
        Indices = array([Array[i].argsort()[::-1] for i in n])
        Array = array([sort(Array[i])[::-1] for i in n])
    if indices:
        return Array, Indices
    else:
        return Array
# EOF
    






