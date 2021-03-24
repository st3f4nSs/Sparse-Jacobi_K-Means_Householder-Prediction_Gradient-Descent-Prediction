function [sol] = hsvHistogram(path_to_image, count_bins)
	RGB = imread(path_to_image);
	R = RGB(:, :, 1);
	R = R(:)';
	G = RGB(:, :, 2);
	G = G(:)';
	B = RGB(:, :, 3);
	B = B(:)';
	sol = zeros(1, 3 * count_bins);
	[H, S, V] = RGB2HSV(R, G, B);
	div = (1.01 / count_bins);
	n = length(H);
	j = 1 : count_bins;
	interval = (j - 1) * div;
	interval = [interval, count_bins * div];
	array = histc(H, interval);
	sol(1 : count_bins) = array(1 : count_bins);
	sol(count_bins) += array(count_bins + 1);

	array = histc(S, interval);
	sol(count_bins + 1 : 2 * count_bins) = array(1 : count_bins);
	sol(count_bins) += array(count_bins + 1);

	array = histc(V, interval);
	sol(2 * count_bins + 1 : 3 * count_bins) = array(1 : count_bins);
	sol(3 * count_bins) += array(count_bins + 1);


end 