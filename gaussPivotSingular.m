function [ x, D ] = gaussPivotSingular( A, b, tol )
%%Aadil Sookia and Tzvi Spivak
%%Aadil - 1000623907 and Tzvi - 1000782842
% input:
%   A = matrix we're trying to solve
%   b = B vector
%   tol = acceptable tolerance level for close-to-zero determinant
% output:
%   x = solution to system of linear equations
%   D = determinant of matrix 
% CITATION: Textbook - Chapra, S. C. and Canale, R. P. Numerical 
%           Methods for Engineeers
    
    %size of matrix - used everywhere
    n = size (A,1);
    
    %max coefficient of each row - stored in vector S
    max_coef = max(A,[], 2);
    
    %call pivot function with matrix, b vector, max_coef vector and k =
    %location
    [A,b] = eliminate (A,b,max_coef,n);
    
    %compute determinant
    D = 1;
    
    for a = 1:n
        
        D = D*A(a,a);
        
    end
    
    %check if near zero else continue
    if abs(D) > tol
        
        [A,b,x] = substitute (A, b, n);
    
        x = x'
        
        D
    else 
        
        error ('The determinant is close-to-zero (below tolerance) and therefore cannot return an accurate solution')
        
    end

    
    
end

%receives the maxtrix with B vector and size
function [A, b, x] = substitute (A, b, n)

    %last element is equal to last element of B
    x(n) = b(n)/A(n,n);
    
    %iterate through remaining rows backwards (-1 step)
    for ii = n - 1 : -1 : 1
        
        %computes the sum for variable at row i
        sum = 0;
        
        for jj = ii + 1 : n
            
            sum = sum + A(ii,jj)*x(jj);
            
        end
        
        x(ii) = (b(ii) - sum)/A(ii,ii);
        
    end



end



%receives the matrix with B vector, max_coef and size
function [A, b] = eliminate (A, b, s, n)

    %iterate through col 1 to n-1 
    for k = 1 : n-1
        
        %pivot columnds if necessary
        [A,b,s] = pivot (A,b,s,k,n);
        
        %eliminate the columns elements of location = k
        for ii = k + 1 : n
            
            %computes the elimination factor
            factor = A(ii,k)/A(k,k);
            
            %for all relevant elements in row, change according to factor
            for jj = k + 1:n
                
                A(ii,jj) = A(ii,jj) - factor*A(k,jj);
                
            end
            
            %changes B vector to reflect elimination
            b(ii) = b(ii) - factor*b(k);
            
        end
        
    end
    


end


%receives the matrix with B vector, max_coef, size, and location = k
function [A, b, s] = pivot (A, b, s, k, n)
    
    %current pivot location
    p = k;
    
    %find scaled value of pivot element
    big = abs(A(k,k)/s(k));

    %iterate through remaining rows to see if there's bigger element
    for ii = k + 1 : n
        
        %holds element of row
        dummy = abs(A(ii,k)/s(ii));
        
        %if bigger than current BIG, it becomes the new BIG
        if dummy > big 
            
            big = dummy;
            
            p = ii;
            
        end 
            
    end
    
    %we found a new bigger element than the original pivot
    if p ~= k
           
        %pivot elements of A matrix 
        for jj = k : n
            
            dummy = A(p,jj);
            
            A(p,jj) = A(k,jj);
            
            A(k,jj) = dummy;
            
        end
        
        %pivot elements of B vector and max_coef
        dummy = b(p);
        
        b(p) = b(k);
        
        b(k) = dummy;
        
        dummy = s(p);
        
        s(p) = s(k);
        
        s(k) = dummy;
        
    end
    
end
