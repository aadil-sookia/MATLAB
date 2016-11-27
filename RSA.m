function [ e, d, c, mPrime ] = RSA (p, q, m)
%   Muhammad Sookia (1000623907) and Tzvi Spivak (1000782842)
% input:
%   p, q = prime numbers to compute theta and N
%   m = original message (either integer or string)
% output:
%   e, d = values used to encrypt/decrypt
%   c = ciphertext of original message m (encryption of m)
%   mPrime = decrypted ciphertext (should be the same as m)


N = p*q;

theta = (p-1)*(q-1);

e = coprime(theta);

d = ExtendedEuclidean (e, theta);

if isnumeric(m)
    
    c = recursiveModExp (m, e, N);
    
    mPrime = recursiveModExp(c,d,N);
    
else
    
    mNew = double(m);
    
    c = zeros(1,length(mNew));
    
    mPrime = zeros(1,length(mNew));
    
    for j = 1:length(mNew)
        
        c(j) = recursiveModExp(mNew(j),e,N);
        
        mPrime(j) = recursiveModExp(c(j),d,N);
        
    end
    
    mPrime = char(mPrime);
       
end

end











function e = coprime (n)

vec = primes(n);

for i = 1:length(vec)

    if mod(n,vec(i)) ~= 0
        
        e = vec(i);
        
        break
    
    end
    
end

end

function [x, y, d] = ExtendedEuclidean (a, b)

if b == 0
    
    x = 1;
    y = 0;
    d = a;
    
    return
    
end

[x2,y2,d2] = ExtendedEuclidean (b, mod(a,b));

x = y2;

y = x2 - floor(a/b)*y2;

d = d2;

end

function x = recursiveModExp (a, b, N)

if b == 0
    
    x = 1;
    
    return
    
end

x = recursiveModExp(a, floor(b/2), N);

if mod (b,2) == 0
    
    x = mod(x^2,N);
    
    return
    
else
    
    x = mod(a*(x^2),N);
    
    return
    
end

end

