function [sol] = rgbHistogram(path_to_image, count_bins)
	RGB = imread(path_to_image);
	R = RGB(:, :, 1);
	R = R(:)';
	G = RGB(:, :, 2);
	G = G(:)';
	B = RGB(:, :, 3);
	B = B(:)';
	sol = zeros(1, 3 * count_bins);
	div = (256 / count_bins);

	j = 1 : count_bins;
	interval = (j - 1) * div;
	interval = [interval, count_bins * div];
	array = histc(R, interval);
	sol(1 : count_bins) = array(1 : count_bins);
	sol(count_bins) += array(count_bins + 1);

	array = histc(G, interval);
	sol(count_bins + 1 : 2 * count_bins) = array(1 : count_bins);
	sol(count_bins) += array(count_bins + 1);

	array = histc(B, interval);
	sol(2 * count_bins + 1 : 3 * count_bins) = array(1 : count_bins);
	sol(3 * count_bins) += array(count_bins + 1);


endfunction