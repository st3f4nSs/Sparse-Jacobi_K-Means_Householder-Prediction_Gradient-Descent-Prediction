function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
	cats = strcat(path_to_dataset, "cats/");
	not_cats = strcat(path_to_dataset, "not_cats/");
	catsFiles = strcat(path_to_dataset, "cats/*.*");
	not_catsFiles = strcat(path_to_dataset, "not_cats/*.*");
	FilesCats = dir(catsFiles);
	FilesNoCats = dir(not_catsFiles);
	Ncats = length(FilesCats) - 1;
	NnoCats = length(FilesCats) - 1;
	X = zeros(Ncats + NnoCats, 3 * count_bins);
	y = zeros(Ncats + NnoCats, 1);
	y([1 : Ncats]) = 1;
	y([Ncats + 1 : Ncats + NnoCats]) = -1;
	if histogram == 'RGB'
		for k = 1 : Ncats
			X(k, :) = rgbHistogram(strcat(cats, FilesCats(k).name), count_bins);
		endfor
		for k = 1 : NnoCats
			X(k + Ncats, :) = rgbHistogram(strcat(not_cats, FilesNoCats(k).name), count_bins);
		endfor
	else
		for k = 1 : Ncats
			X(k, :) = hsvHistogram(strcat(cats, FilesCats(k).name), count_bins);
		endfor
		for k = 1 : NnoCats
			X(k + Ncats, :) = hsvHistogram(strcat(not_cats, FilesNoCats(k).name), count_bins);
		endfor
	endif
	
	
endfunction
