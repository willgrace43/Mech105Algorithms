function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit)
%falsePosition finds the root of a function using false position method
i = 0;
ea = 100;
xrold = xu;

if nargin <3
    error('not enough inputs')
end
if nargin == 3 %no ea or maxit
    es = 0.0001;
    maxit = 200;
end
if nargin == 4 %no maxit
    maxit = 200;
end

if func(xu)*func(xl) > 0 %is there a root? 
    fprintf('the specified values do not bracket a root')
end

if func(xu)*func(xl) == 0 %is one of the values a root
    ea = 0;
    iter = i;
    if func(xu) == 0
        root = xu;
        fx = func(xu);
    else
        root = xl;
        fx = func(xl);
    end
end

if func(xu)*func(xl) < 0 %there is a root
    while ea > es %es break
        if i == maxit %maxit break
            break
        end
        xr = xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu))); %fp formula
        if i < 1 %first iteration ea 
            ea = abs((xr-xu)/xr)*100;
            xl = xr;
        end
        if 1 <= i  %continuing guesses ea
            ea = abs((xr-xrold)/xr)*100;
            xl = xr; %can just replace xl each time
        end
        xrold = xr;  
        i = i+1;
    end
end
root = xr;
fx = func(xr);
iter = i-1; 
end