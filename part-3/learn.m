function [w] = learn(X, y)
  [n m] = size(X);
  X2 = X;
  X2(1:n, m + 1) = 1;
  [Q, R] = Householder(X2);
  z = Q' * y;
  w = SST(R, z);
endfunction
