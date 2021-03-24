function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
	cats = strcat(path_to_testset, "cats/");
	not_cats = strcat(path_to_testset, "not_cats/");
	catsFiles = strcat(path_to_testset, "cats/*.*");
	not_catsFiles = strcat(path_to_testset, "not_cats/*.*");
	FilesCats = dir(catsFiles);
	FilesNoCats = dir(not_catsFiles);
	Ncats = length(FilesCats) - 1;
	NnoCats = length(FilesCats) - 1;
	X = zeros(Ncats + NnoCats, 3 * count_bins);
	y = zeros(1, Ncats + NnoCats);
	y([1 : Ncats]) = 1;
	y([Ncats + 1 : Ncats + NnoCats]) = -1;
	n = Ncats + NnoCats;

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

	X = (X - repmat(mean(X), n, 1)) ./ repmat(std(X), n, 1);
	X(:, 3 * count_bins + 1) = 1;
	y1 = w' * X';
	Ans = zeros(1, Ncats + NnoCats);
	Ans(:) = -1;
	Ans([floor(y1) >= 0]) = 1;
	n1 = sum(Ans == y);
	percentage = double(n1) / n;
endfunction