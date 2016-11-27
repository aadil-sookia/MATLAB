function [root,fx,emax]=bisect(func,xl,xu,ed,varargin)
%%Aadil Sookia and Tzvi Spivak
%%Aadil - 1000623907 and Tzvi - 1000782842
% input:
%   func = name of function
%   xl, xu = lower and upper guesses
%   ed = desired maximum error
%   varargin = additional parameters used by func
% output:
%   root = real root
%   fx = function value at root
%   emax = actual maximum error given number of iterations taken
%          note: not true error!

max_n = ceil(log((xu-xl)/ed) / log(2))

root = (xl+xu)/2;

f_l = feval(func,xl,varargin{:});

fx = feval(func,root,varargin{:});

for i = 1:max_n
    
    test = f_l * fx;
    
    if test < 0 %root is on left side
        
        xu = root;
    
    elseif test > 0 %root is on right side
          
        xl = root;
        
        f_l = fx;
    
    else %found root - exit loop
        
        break
    
    end
        
    rootPrev = root;
    
    root = (xl+xu)/2;
    
    fx = feval(func,root,varargin{:});
    
    if root ~= 0
        
        emax = (root - rootPrev)/root;
    
    end
        
end 

fx

root

emax

end