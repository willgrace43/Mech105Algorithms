function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%%
sx = size(x);
sy = size(y);
n = sx(1,2);

if sx(1,2) ~= sy(1,2)
    error('input arrays are not the same size')
end
for d = 1:n-2
    s1 = x(1,d+1) - x(1,d);
    s2 = x(1,d+2) - x(1,d+1);
    if s1 ~= s2
        error('Intervals are not evenly spaced')
    end
end

%%
I = 0;
v = 1;
if n == 2
    itersimp = 0; %false
    itertrap = 0; %true
elseif n==3
    itersimp = 1; %true
    itertrap = 1; %false
else
    itersimp = floor((n-1)/2);
    itertrap = ceil(rem(n,2));
end


while(1)
    for h = 1 : itersimp %number of times can use 1/3 rule
        Inew = (x(1,v+2)-x(1,v)) * (y(1,v) + 4*y(1,v+1) + y(1,v+2)) / 6; %simpsons 1/3 rule
        v = v+2;
        I = I + Inew;
    end
    if itertrap == 0 %somehow if it is zero, there is a remainder idk
        warning('Due to an odd number of intervals, the Trapezoidal rule will be used for the last interval')
        T = (x(1,n)-x(1,n-1)) * (y(1,n)+y(1,n-1))/2;
        I = I+T;
    end
    break
end
end


