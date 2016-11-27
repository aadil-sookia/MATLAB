function [results] = modFunction (x, y, n, k)
% Oghosa Igbinakenzua (1000782842)
% Collaborated with Aadil Sookia
% input:
%   x, y, n, k = values used in the mod calculations
% output:
%   results = 10D vector with values of operations

totTemp = tic;

results = zeros (10,1);

results (1) = mod (x, n) + mod (y, n);

results (2) = mod (x, n) - mod (y, n);

results (3) = mod (x,n) * mod (y,n);

xTemp = tic;

results (4) = mulinv(x,n);

results (8) = toc (xTemp);

yTemp = tic;

results (5) = mulinv(y,n);

results (9) = toc (yTemp);

results (6) = mod (x^k, n);

results (7) = mod (y^k, n);

results (10) = toc (totTemp);

end

