function [centroids] = clustering_pc(points, NC)
  [n, m] = size(points);
  centroids = zeros(NC, m);
  CLS = zeros(NC, m);
  for i = 0:1:NC - 1
    cnt = 0;
    for j = 1:1:n
      if mod(j, NC) == i
        cnt++;
        CLS(i + 1, :) += points(j, :);
      endif
    endfor
    CLS(i + 1, :) = CLS(i + 1, :) / cnt;
  endfor

  while 1
    centroids = CLS;
    CLS = zeros(NC, m);
    retine_cate_pct = zeros(1, NC);
    for i = 1:1:n
      bec = 0;
      for j = 1:1:NC
        if bec == 0
          min = norm(centroids(j, :) - points(i, :));
          curent = j;
          bec = 1;
        endif
        if bec == 1 && norm(centroids(j, :) - points(i, :)) < min
          min = norm(centroids(j, :) - points(i, :));
          curent = j;
        endif
      endfor
      retine_cate_pct(curent)++;
      CLS(curent, :) += points(i, :);
    endfor
    for i = 1:1:NC
      CLS(i, :) = CLS(i, :) / retine_cate_pct(i);
    endfor
    if CLS == centroids
      break;
    endif
  endwhile
endfunction
