function remainder = bigmod (number, power, modulo)
% modulo function for large numbers, -> number^power(mod modulo)

% by bennyboss / 2005-06-24 / Matlab 7
% I used algorithm from this webpage:
% http://www.disappearing-inc.com/ciphers/rsa.html

% binary decomposition
binary(1,1) = 1;
col = 2;
while ( binary(1, col-1) <= power-binary(1, col-1) )
    binary(1, col) = 2*binary(1, col-1);
    col = col + 1;
end

% flip matrix
binary = fliplr(binary);

% extract binary decomposition from number
result = power;
cols = length(binary);
extracted_binary = zeros(1, cols);
index = zeros(1, cols);
for ( col=1 : cols )
    if( result-binary(1, col) > 0 )
        result = result - binary(1, col);
        extracted_binary(1, col) = binary(1, col);
        index(1, col) = col;        
    elseif ( result-binary(1, col) == 0 )
        
        extracted_binary(1, col) = binary(1, col);
        index(1, col) = col;                
        break;
        
    end
end

% flip matrix
binary = fliplr(binary);

% doubling the powers by squaring the numbers

cols2 = length(extracted_binary);
rem_sqr = zeros(1, cols);
rem_sqr(1, 1) = mod(number^1, modulo);

if ( cols2 > 1 )
    for ( col=2 : cols)
        rem_sqr(1, col) = mod(rem_sqr(1, col-1)^2, modulo);
    end
end

% flip matrix
rem_sqr = fliplr(rem_sqr);

% compute reminder

index = find(index);

remainder = rem_sqr(1, index(1, 1));

cols = length(index);
for (col=2 : cols)
    remainder = mod(remainder*rem_sqr(1, index(1, col)), modulo);
end