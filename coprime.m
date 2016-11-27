function e = coprime (n)

vec = primes(n);

for i = 1:length(vec)

    if mod(n,vec(i)) ~= 0
        
        e = vec(i)
        
        break
    
    end
    
end

end