function x = recursiveModExp (a, b, N)

if b == 0
    
    x = 1;
    
    return
    
end

x = recursiveModExp(a, floor(b/2), N)

if mod (b,2) == 0
    
    x = mod(x^2,N);
    
    return
    
else
    
    x = mod(a*(x^2),N);
    
    return
    
end

end
