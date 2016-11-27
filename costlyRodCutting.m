function [ r, s ] = costlyRodCutting (p,n,c)
%   Muhammad Sookia (1000623907) and Tzvi Spivak (1000782842)
% input:
%   p = price vector (row vector)
%   n = original size of rod
%   c = cost per cut
% output:
%   r = objective value (max revenue)
%   s = optimal cut lengths

r = zeros (1,n+1);
s1 = zeros(1,n+1);

for j = 1:n
    
    q = p(j);
    s1 (j+1) = j;
    for i = 1 : j-1
     
        if q < p(i) + r(j-i+1)
            
            q = p(i) + r(j-i+1) - c;
            
            s1(j+1) = i;
      
        end 
        
    end

    r(j+1) = q;
    
end

r = r(n+1);
 
i = 0;

s = [];

while n > 0
    i = i + 1;
    s(i) = s1(n+1);
    n = n - s1(n+1);
end

end

