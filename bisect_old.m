function [c,t] = bisect_old (fn, a, b, tol)
%function which locates root of the function fn
% on the interval [a,b] to within a tolerance of tol.
% assumes opposite signs at a and b
% returns c as final interval and computational time as t

tic 

fa = feval(fn,a);
fb = feval(fn,b);

if fa*fb >=0
    error('the function must have opposite signs at a and b dumbass')
end

%acts as a boolean (false = 0)
done = 0;

%bisect the interval
c = (a+b/2);

%main loop
while abs(a-b) > 2*tol && ~done
    
    fc = feval(fn,c);
    
    if fa*fc < 0
        b = c;
        fb = fc;
        c = (a+b)/2;
    elseif fc*fb < 0 
        a = c;
        fa = fc;
        c = (a+b)/2;
    else
        done = 1
    end
    
end

t = toc;




