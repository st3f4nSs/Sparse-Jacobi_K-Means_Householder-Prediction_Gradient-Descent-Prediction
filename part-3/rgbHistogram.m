function [sol] = rgbHistogram(path_to_image, count_bins)
  img = imread(path_to_image);
  [n, m, p] = size(img);
  cnt = 1;
  for i = 0:1:count_bins - 1
    edges(cnt) = i * 256 / count_bins;
    cnt++;
  endfor
  edges(cnt) = i * 256 / count_bins + 256 / count_bins;
  val_r = histc(img(:, :, 1), edges);
  val_g = histc(img(:, :, 2), edges);
  val_b = histc(img(:, :, 3), edges);
  sol1 = sum(val_r');
  sol2 = sum(val_g');
  sol3 = sum(val_b');
  sol = horzcat(sol1([1:count_bins]), sol2([1:count_bins]), sol3([1:count_bins]));
endfunction
