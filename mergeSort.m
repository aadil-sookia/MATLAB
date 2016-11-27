function array = mergeSort (A, p, r)
%%Aadil Sookia and Tzvi Spivak
%%Aadil - 1000623907 and Tzvi - 1000782842

%%check if size <> 1 - if true, then continue to divide and merge
if (r > p)
    %%find midpoint
    q = floor ((p+r)/2);
 
    %%divide left half
    A = mergeSort (A, p, q);
    
    %%divide right half
    A = mergeSort (A, q+ 1, r);
    
    %%merge two halves
    A = merge (A, p, q, r);
    
end

array = A;

end

%%receives an array with two sorted halves and then merges them
function A = merge (A, p, q, r)

n1 = q - p + 1;
n2 = r - q;

%left half of array (+1 for infinity term)
for ii = 1:n1
    L(ii) = A(p+ii-1);
end

%right half of array (+1 for infinity term)
for jj = 1:n2
    R(jj) = A(q+jj);
end

%assign infinity terms
L(n1+1) = inf;
R(n2+1) = inf;

a = p;

while ~(length(L)== 1 && length(R) == 1)
    
    if L(1) <= R(1)
        A(a) = L(1);
        L(1) = [];
        a = a+1;
    else
        A(a) = R(1);
        R(1) = [];
        a = a+1;
    end
  
end

end