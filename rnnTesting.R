
library(rnn)

# Example 
#------------------------------------------------------------------------

set.seed(1)

# create training numbers
X1 = sample(0:127, 5000, replace=TRUE)
X2 = sample(0:127, 5000, replace=TRUE)

# create training response numbers
Y <- X1 + X2

# convert to binary
X1 <- int2bin(X1, length=8)
X2 <- int2bin(X2, length=8)
Y  <- int2bin(Y,  length=8)

# Create 3d array: dim 1: samples; dim 2: time; dim 3: variables.
X <- array( c(X1,X2), dim=c(dim(X1),2) )
Y <- array( Y, dim=c(dim(Y),1)) 

# train the model
model <- trainr(Y=Y[,dim(Y)[2]:1,,drop=F], # we inverse the time dimension
                X=X[,dim(X)[2]:1,,drop=F], # we inverse the time dimension
                learningrate   =  0.05,
                hidden_dim     = 10,
                batch_size = 100,
                numepochs = 10)

plot(colMeans(model$error),type='l',
     xlab='epoch',
     ylab='errors'                  )

#---------------------------------------------------------------------------

# create test inputs
A1 = int2bin( sample(0:127, 7000, replace=TRUE) )
A2 = int2bin( sample(0:127, 7000, replace=TRUE) )

# create 3d array: dim 1: samples; dim 2: time; dim 3: variables
A <- array(c(A1,A2), dim=c(dim(A1),2) )

# predict
B  <- predictr(model,
               A[,dim(A)[2]:1,,drop=F]
)
B = B[,dim(B)[2]:1]

hist( B-(A1+A2) )
