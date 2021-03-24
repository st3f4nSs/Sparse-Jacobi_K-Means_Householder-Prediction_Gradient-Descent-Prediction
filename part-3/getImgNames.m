function [imgs] = getImgNames(directory)
  path_to_imgs = strcat(directory, '*jpg');
  img_files = dir(path_to_imgs);
  n = length(img_files);
  D = 1:10;
  imgs(1:n, D) = 0;
  for i = 1:n
    l = 1:length(img_files(i).name);
    imgs(i, l) = img_files(i).name;
  endfor
  imgs = char(imgs);
endfunction
