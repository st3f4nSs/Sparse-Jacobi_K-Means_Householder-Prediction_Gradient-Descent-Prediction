function [H S V] = rgbtohsv(R, G, B)
  R2 = double(R) ./ 255;
  G2 = double(G) ./ 255;
  B2 = double(B) ./ 255;
  [n, m] = size(R);
  H = zeros(n, m);
  S = zeros(n, m);
  V = zeros(n, m);
  Cmax = max(R2, max(G2, B2));
  Cmin = min(R2, min(G2, B2));
  delta = Cmax - Cmin;
  H(delta == 0) = 0;
  H(delta != 0 & Cmax == R2) = (mod((G2(delta != 0 & Cmax == R2)
  - B2(delta != 0 & Cmax == R2)) ./ delta(delta != 0 & Cmax == R2), 6)) .* 60;
  H(delta != 0 & Cmax == G2) = ((B2(delta != 0 & Cmax == G2)
  - R2(delta != 0 & Cmax == G2)) ./ delta(delta != 0 & Cmax == G2) + 2) .* 60;
  H(delta != 0 & Cmax == B2) = ((R2(delta != 0 & Cmax == B2)
  - G2(delta != 0 & Cmax == B2)) ./ delta(delta != 0 & Cmax == B2) + 4) .* 60;
  H = H ./ 360;
  S(Cmax == 0) = 0;
  S(Cmax != 0) = delta(Cmax != 0) ./ Cmax(Cmax != 0);
  V = Cmax;
endfunction
