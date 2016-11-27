function [xGreedy,xIP,dObj, dSize, dTime] = setCover (A, c, k)
%   Muhammad Sookia (1000623907) and Tzvi Spivak (1000782842)
% input:
%   A = adjacency matrix
%   c = cost vector (as a ROW VECTOR)
%   k = cover level (as a scalar)
% output:
%   xGreedy = greedy solution
%   xIP = IP solution
%   dObj = difference between objective value
%   dSize = difference between solution set size
%   dTime = difference between computational time

%convert cost vector to row if column
if iscolumn(c)
    c = c';
end 
%creating a column vector for the k values
k = ones(size(c'))*k;

x_all = ones (size(c'));
%check if feasible - if not, return
if (A*x_all >= k) ~=1
    disp('This problem is not feasible')
    xGreedy = zeros(size(k));
    xIP = xGreedy;
    dObj = -1;
    dSize = -1;
    dTime = -1;
    return
end 

%heuristic solution with min cost/element

tic

%initializing x, A_temp, k_temp, c_temp for heuristic
xGreedy = zeros (size(c'));
A_temp = A;
k_temp = k;
c_temp = c;

%while we have not yet found soln that covers all elements at order level
while  sum(A*xGreedy >= k) < size(k,1)
    
    %calculate minimum cost per element stored in I
    
    [M,I] = min(c_temp./sum(A_temp,1));
    
    %enter the column into solution set and change C to prevent looping
    xGreedy(I) = 1;
    c_temp(I) = Inf;

    %check if any rows can be removed
    sol = k_temp - A_temp*xGreedy;
    
    for a = size(sol):-1:1
        if sol(a) <= 0 
            k_temp(a) = [];
            A_temp(a,:) = [];
        end
    end
    
end

fvalGreedy = c*xGreedy;

timeGreedy = toc;

%binary integer programming solution
%change A and k to negative since <= constraints
tic

f = c;

lb = zeros (size(f));

ub = lb + 1;

intvars = 1:length(f);

[xIP,fvalIP] = intlinprog (f, intvars, -A, -k,[],[],lb,ub);

timeIP = toc;

dObj = (fvalGreedy - fvalIP)/fvalIP;
dSize = (sum(xGreedy)-sum(xIP))/sum(xIP);
dTime = (timeGreedy - timeIP)/timeIP;


end

