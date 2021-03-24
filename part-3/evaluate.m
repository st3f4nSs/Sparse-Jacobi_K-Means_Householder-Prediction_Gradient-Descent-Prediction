function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  if strcmp(histogram, "RGB")
    bec = 1;
  else
    bec = 2;
  endif
  cnt = 0;
  path_f1 = strcat(path_to_testset, "cats/");
  path_f2 = strcat(path_to_testset, "not_cats/");
  imgs1 = getImgNames(path_f1);
  imgs2 = getImgNames(path_f2);
  [n m] = size(imgs1);
  [p q] = size(imgs2);
  for i = 1:1:n
    path = strcat(path_f1, imgs1(i, :));
    if bec == 1
      [x] = rgbHistogram(path, count_bins);
    else
      [x] = hsvHistogram(path, count_bins);
    endif
    x(3 * count_bins + 1) = 1;
    y = w' * x';
    if y > 0
      cnt++;
    endif
  endfor
  for i = 1:1:p
    path = strcat(path_f2, imgs2(i, :));
    if bec == 1
      [x] = rgbHistogram(path, count_bins);
    else
      [x] = hsvHistogram(path, count_bins);
    endif
    x(3 * count_bins + 1) = 1;
    y = w' * x';
    if y < 0
      cnt++;
    endif
  endfor
  percentage = cnt / (n + p);
endfunction
