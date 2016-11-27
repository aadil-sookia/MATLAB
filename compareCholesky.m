function [ myL, matL, myTime, matTime ] = compareCholesky( arrayA )
%   Muhammad Sookia (1000623907) and Tzvi Spivak (1000782842)
% input:
%   arrayA = 2D array of matrices we're applying Cholesky Decomposition
% output:
%   myL = Lower Triangular matrix from our algorithm
%   matL = Lower Triangular matrix from MATLAB's in-house chol function
%   myTime = time to compute lower triangular using our algorithm
%   matTime = time to compute lower triangular using chol function
%   CITATION: Professor's Notes

[r,c,m] = size (arrayA);

myL = zeros(r,c,m);

matL = myL;

myTime = 0;

matTime = 0;

for i = 1 : m

    M = arrayA(:,:,i);
    
    tic
    
    matL(:,:,i) = chol (M, 'lower');
    
    matTime = matTime + toc;
    
    tic

    myL(:,:,i) = cholesky (M);
    
    myTime = myTime + toc;

end

myTime = myTime/m;

matTime = matTime/m;

end


function [L] = cholesky (M)

n = length (M);

L = zeros( n, n );

L(1,1) = sqrt (M(1,1));

if n == 1
    
    return;
    
end

L(2:end,1) = (1/L(1,1))*M(2:end,1);

L(1,2:end) = 0;

L(2:end,2:end) = cholesky (M(2:end,2:end) - L(2:end,1)*(L(2:end,1))');

end



