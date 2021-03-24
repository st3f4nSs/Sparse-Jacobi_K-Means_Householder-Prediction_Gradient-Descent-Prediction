function [H, S, V] = RGB2HSV(R, G, B)
	n = length(R);
	H = S = V = double(zeros(1, n));

	NewR = double(R) / 255;
	NewG = double(G) / 255;
	NewB = double(B) / 255;
	Cmax = max(max(NewR, NewG), NewB);
	Cmin = min(min(NewR, NewG), NewB);
	Delta = Cmax - Cmin;

	indicesR = Delta ~= 0 & Cmax == NewR;
	indicesB = Delta ~= 0 & Cmax == NewB;
	indicesG = Delta ~= 0 & Cmax == NewG; 
	indicesCmax = find(Cmax >= 0.0001);

	V = Cmax;
	S(indicesCmax) = Delta(indicesCmax) ./ Cmax(indicesCmax);
	H(indicesB) = 60 * (((NewR(indicesB) - NewG(indicesB)) ./ Delta(indicesB)) + 4);
	H(indicesG) = 60 * (((NewB(indicesG) - NewR(indicesG)) ./ Delta(indicesG)) + 2);
	H(indicesR) = 60 * mod((NewG(indicesR) - NewB(indicesR)) ./ Delta(indicesR) , 6);
	H /= 360;

endfunction