function [A, b] = generate_probabilities_system(rows)
  A = zeros(rows);
  n = rows;
  nr_el = n * (n + 1) / 2;
  A(1, 1) = 4;
  A(n * (n + 1) / 2, n * (n + 1) / 2) = 4;
  A(n * (n + 1) / 2 - n + 1, n * (n + 1) / 2 - n + 1) = 4;
  for i = 3:1:n - 1
    inc = (i * (i + 1)) / 2 - i + 1;
    for j = inc + 1:1:inc + i - 2
      A(j, j) = 6;
    endfor
  endfor
  for i = 1:1:nr_el
    if A(i, i) == 0
      A(i, i) = 5;
    endif
  endfor
  A(1, 2) = -1;
  A(1, 3) = -1;
  A(n * (n + 1) / 2, n * (n + 1) / 2 - 1) = -1;
  A(n * (n + 1) / 2, n * (n - 1) / 2) = -1;
  A(n * (n + 1) / 2 - n + 1, n * (n + 1) / 2 - n + 2) = -1;
  A(n * (n + 1) / 2 - n + 1, n * (n - 1) / 2 - (n - 1) + 1) = -1;
  for i = 2:1:n - 1
    A(i * (i + 1) / 2 - i + 1, i * (i + 1) / 2 - i + 2) = -1;
    A(i * (i + 1) / 2 - i + 1, (i + 1) * (i + 2) / 2 - i) = -1;
    A(i * (i + 1) / 2 - i + 1, (i - 1) * i / 2 - i + 2) = -1;
    A(i * (i + 1) / 2 - i + 1, (i + 1) * (i + 2) / 2 - i + 1) = -1;
    A(i * (i + 1) / 2, i * (i - 1) / 2) = -1;
    A(i * (i + 1) / 2, i * (i + 1) / 2 - 1) = -1;
    A(i * (i + 1) / 2, (i + 1) * (i + 2) / 2) = -1;
    A(i * (i + 1) / 2, (i + 1) * (i + 2) / 2 - 1) = -1;
  endfor
  for i = nr_el - n + 2:1:nr_el - 1
    A(i, i - 1) = -1;
    A(i, i + 1) = -1;
    A(i, i - n) = -1;
    A(i, i - n + 1) = -1;
  endfor
  for i = 3:1:n - 1
    inc = i * (i + 1) / 2 - i + 1;
    cnt = 1;
    for j = inc + 1:1:inc + i - 2
      A(j, j + 1) = -1;
      A(j, j - 1) = -1;
      A(j, i * (i - 1) / 2 - (i - 1) + 1 + (cnt - 1)) = -1;
      A(j, i * (i - 1) / 2 - (i - 1) + 1 + cnt) = -1;
      A(j, (i + 1) * (i + 2) / 2 - (i + 1) + 1 + cnt) = -1;
      A(j, (i + 1) * (i + 2) / 2 - (i + 1) + cnt + 2) = -1;
      cnt++;
    endfor
  endfor
  b = zeros(nr_el, 1);
  for i = nr_el - n + 1:1:nr_el
    b(i) = 1;
  endfor
endfunction