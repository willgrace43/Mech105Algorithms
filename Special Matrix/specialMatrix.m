function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A = zeros(n,m);

% Now the real challenge is to fill in the correct values of A
A(1,1)= 1;
if nargin ~=2
    error('Please input two numbers for matrix')
end

for x = 1:m
    for y = 1:n
        if x==1
            A(y,x) = y
        else if y==1
                A(y,x) = x
        else
            A(y,x) = A(y-1,x) + A(y,x-1)
        end
        end
    end
end
end