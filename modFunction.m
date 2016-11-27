function [results] = modFunction (x, y, n, k)
%   Muhammad Sookia (1000623907) and Tzvi Spivak (1000782842)
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

results (4) = mulinv (x, n);

results (8) = toc (xTemp);

yTemp = tic;

results (5) = mulinv (y, n);

results (9) = toc (yTemp);

if k >= 0

    results (6) = mod (x^k, n);


    results (7) = mod (y^k, n);
    
else
    
    results (6) = mod (mulinv(x,n)^abs(k),n);
    
    results (7) = mod (mulinv(y,n)^abs(k),n);
       
end

results (10) = toc (totTemp);

end

function y = mulinv (x, p)

k = 0;

m = mod (k*p+1,x);

while sum(m)
    k = k + sign(m);
    m = mod (k*p+1,x);
end

y = (k*p+1)./x;

end

