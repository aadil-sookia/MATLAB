function [ result ] = extendedEuclideanTry( x,n )
ctr = 1;
k(ctr)=0;
tempX(ctr) = x;
tempN(ctr) = n;

%going forward
while k(ctr) ~= 1 && (tempX(ctr) ~= 0 && tempN(ctr) ~=0)
    m(ctr) = floor(tempN(ctr)/tempX(ctr));
    k(ctr+1) = tempN(ctr) - m(ctr)*tempX(ctr);
    ctr = ctr + 1;
    tempX(ctr) = k(ctr);
    tempN(ctr) = tempX(ctr-1);
end

if k ~= 1
    display('no inverse modulo')
    result = NaN;
    return;
end

tr(1) = -m(1);
tr(2) = 1 - m(2)*tr(1);

%back substitution
for ii = 3:ctr-1
    tr(ii) = tr(ii-2) - m(ii)*tr(ii-1);
end
tr
result = mod(tr(ctr-1), n);
end

