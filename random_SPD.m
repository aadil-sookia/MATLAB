function A = random_SPD(n)

% % Generate a dense n x n symmetric, positive definite matrix
% 
% A = rand(n,n); % generate a random n x n matrix
% 
% % construct a symmetric matrix using either
% A = A+A'; 
% % The first is significantly faster: O(n^2) compared to O(n^3)
% 
% % since A(i,j) < 1 by construction and a symmetric diagonally dominant matrix
% %   is symmetric positive definite, which can be ensured by adding nI
% A = A + n*eye(n);

Q = randn(n,n);

eigen_mean = 2; 
% can be made anything, even zero 
% used to shift the mode of the distribution

A = Q' * diag(abs(eigen_mean+randn(n,1))) * Q;

return 