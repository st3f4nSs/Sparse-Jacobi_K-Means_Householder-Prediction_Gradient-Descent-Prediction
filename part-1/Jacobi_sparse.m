function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  [n, m] = size(c);
  x1 = zeros(n, 1);
  x2 = csr_multiplication(G_values, G_colind, G_rowptr, x1) + c;
  while 1
    if norm(x2 - x1) < tol
      break;
    endif
    x1 = x2;
    x2 = csr_multiplication(G_values, G_colind, G_rowptr, x1) + c;
  endwhile
  x = x2;
endfunction
