function eApprox = eulerApprox (n)
%%Aadil Sookia and Tzvi Spivak
%%Aadil - 1000623907 and Tzvi - 1000782842


if n < 0
    error ('Cannot compute number for n < 0)')
end

%%size n+1 since we begin sum from 0
array = 1:(n+1);

%%initialize array and sum with 1 (first term)
array(1) = 1;

eApprox = 1;

%%loop through array, storing values and then adding it to the sum
for ii = 2:(n+1)
    array (ii) = (ii-1)*array(ii-1);
    eApprox = eApprox + 1/array(ii);
end 


