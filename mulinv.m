
function y=mulinv(x,p)

% k=zeros(size(x))   %set the counter array
% m=mod(k*p+1,x)     %find reminders
% while sum(m)        %are all reminders zero?
%     k=k+sign(m)   %update the counter array
%     m=mod(k*p+1,x) %caculate new reminders 
% end
% y=(k*p+1)./x       %find the multiplicative inverses of X

k = 0

m = mod (k*p+1,x)

while sum(m)
    k = k + sign(m)
    m = mod (k*p+1,x)
end
y = (k*p+1)./x