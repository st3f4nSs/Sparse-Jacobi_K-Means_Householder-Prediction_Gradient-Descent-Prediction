function [sol] = hsvHistogram(path_to_image, count_bins)
  img = imread(path_to_image);
  [H S V] = rgbtohsv(img(:, :, 1), img(:, :, 2), img(:, :, 3));
  cnt = 1;
  for i = 0:1:count_bins
    edges(cnt) = i * 1.01 / count_bins;
    cnt++;
  endfor
  val_h = histc(H, edges);
  val_s = histc(S, edges);
  val_v = histc(V, edges);
  sol1 = sum(val_h');
  sol2 = sum(val_s');
  sol3 = sum(val_v');
  sol = horzcat(sol1([1:count_bins]), sol2([1:count_bins]), sol3([1:count_bins]));
endfunction
