function [G_J, c_J] = Jacobi_factorization(A, b)
  [n, n] = size(A);
  D = zeros(n);
  P = zeros(n);
  for i = 1:1:n
    D(i, i) = 1 / A(i, i);
  endfor
  for i = 1:1:n
    for j = 1:1:n
      if i != j
        P(i, j) = (-1) * A(i, j);
      endif
    endfor
  endfor
  G_J = D * P;
  c_J = D * b;
endfunction
