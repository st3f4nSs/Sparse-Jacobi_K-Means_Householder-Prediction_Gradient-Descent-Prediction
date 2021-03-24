function [cost] = compute_cost_pc(points, centroids)
  [n, m] = size(points);
  [p, q] = size(centroids);
  s = 0;
  for i = 1:1:n
    bec = 0;
    for j = 1:1:p
      if bec == 0
        min = norm(centroids(j, :) - points(i, :));
        bec = 1;
      endif
      if bec == 1 && norm(centroids(j, :) - points(i, :)) < min
        min = norm(centroids(j, :) - points(i, :));
      endif
    endfor
    s += min;
  endfor
  cost = s;
endfunction
