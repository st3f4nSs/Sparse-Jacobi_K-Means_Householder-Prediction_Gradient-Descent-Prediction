function [w] = learn(X, y, lr, epochs)
	batch_size = 64;
	[N, M] = size(X);
	X = (X - repmat(mean(X), N, 1)) ./ repmat(std(X), N, 1);
	X(:, M + 1) = 1;
	M = M + 1;

	w = 0.2 .* rand(M, 1) - 0.1;

	for epoch = 1 : epochs
		indexes = int32((N - 1) .* rand(batch_size, 1)) + 1;
		Xbatch = X(indexes, :);
		ybatch = y(indexes);
		for j = 1 : M
			w(j) = w(j) - lr * (double(1) / N) * ((Xbatch * w - ybatch)' * Xbatch(:, j));
		endfor
	endfor
endfunction
