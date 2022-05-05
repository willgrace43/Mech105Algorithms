function [L, U, P] = luFactor(A)

% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix


[rows,cols] = size(A);
if rows ~= cols
    error('Matrix is not square')
end

    P = eye(rows);
    L = zeros(rows);

i = 1;
 
while i <= cols %iteration
    [~,c] = max(abs(A(i:end,i))); %max abs value of allowed rows
    c = c + (i-1); %actual row position of max(output based off of #rows checked not total)
    A([i c],:) = A([c i],:); %pivot A, switches matrix rows
    %if no pivoting required, will not change anything

    P([i c],:) = P([c i],:); %Pivot P
    L([i c],:) = L([c i],:); %Pivot L

    for x = i+1 : cols %row value of replacing equation
        l = A(x,i) / A(i,i); %LTM value
        L(x,i) = l; %value for lower tri. matrix
        A(x,:) = A(x,:) - (l * A(i,:)); %forward elim.
    end

    i = i+1;
end

U = A;
L = L + eye(rows);

end
