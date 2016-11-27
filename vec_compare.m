function [tloop, tvec] = vec_compare(n)
tic
for a = 1:n
    sin(a);
end
tloop = toc;

tic
sin(1:n);
tvec = toc;
