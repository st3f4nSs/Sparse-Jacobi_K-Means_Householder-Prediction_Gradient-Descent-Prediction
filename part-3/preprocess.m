function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  if strcmp(histogram, "RGB")
    bec = 1;
  else
    bec = 2;
  endif
  path_f1 = strcat(path_to_dataset, "cats/");
  path_f2 = strcat(path_to_dataset, "not_cats/");
  imgs1 = getImgNames(path_f1);
  imgs2 = getImgNames(path_f2);
  [n m] = size(imgs1);
  [p q] = size(imgs2);
  X = zeros(n + p, count_bins * 3);
  for i = 1:1:n
    path = strcat(path_f1, imgs1(i, :));
    if bec == 1
      [sol] = rgbHistogram(path, count_bins);
    else
      [sol] = hsvHistogram(path, count_bins);
    endif
    X(i, :) = sol;
    y(i, 1) = 1;
  endfor
  for i = 1:1:p
    path = strcat(path_f2, imgs2(i, :));
    if bec == 1
      [sol] = rgbHistogram(path, count_bins);
    else
      [sol] = hsvHistogram(path, count_bins);
    endif
    X(n + i, :) = sol;
    y(n + i, 1) = -1;
  endfor
endfunction
