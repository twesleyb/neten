<<<<<<< HEAD
=======
def Network_Enhancement(W_in,order=2,K,alpha=0.9):
    pass






from numpy import genfromtxt
W_in = genfromtxt('butterfly.csv', delimiter=',')

from numpy import eye

# Remove diagonal.
W_in1 = W_in * (1 - eye(max(W_in.shape)))



>>>>>>> 56ad5684a8ef56654254a223800b6999944d02b5


