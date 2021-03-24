function [values, colind, rowptr] = matrix_to_csr(A)
  [n, n] = size(A);
  cnt = 1;
  cnt2 = 1;
  for i = 1:1:n
    bec = 0;
    for j = 1:1:n
      if A(i, j) != 0
        if bec == 0
          rowptr(cnt2) = cnt;
          cnt2++;
          bec = 1;
        endif
        values(cnt) = A(i, j);
        colind(cnt) = j;
        cnt++;
      endif
    endfor
  endfor
  rowptr(cnt2) = length(colind) + 1;
endfunction
