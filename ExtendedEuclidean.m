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
