function [root, iter, ea] = BisectionFunction(func,xl,xu,es,maxiter)
% A custom function designed to solve for the root of a function using the
% bisection method.
% 
% Inputs
% func - function of which root you need to find
% xl - lower bound on the root x values
% xu - upper bound on the root x values
% es - stopping criterion in %(0.1% if not specified)
% maxiter - max iterations before stopping (200 if not specified)
%
%% Outputs
% root - calculated root
% iter - number of iterations
% ea - approximate error

test = func(xl) * func(xu);
if test > 0
    error('No sign change, check bounds and/or function')
end

if nargin < 5
      maxiter = 200;
end
if nargin < 4
    es = 0.1;
end

iter = 0; 
xr = xl; 
ea = 100;

while (1)
    xrold = xr;
    xr = (xl+xu)/2
    iter = iter + 1;
    if xr ~= 0
        ea = abs((xr-xrold)/xr)*100
    end
    test = func(xl) .* func(xr);
    if test <0
        xu = xr
    elseif test >0
        xl = xr
    else
        ea = 0
    end
    if ea <= es || iter == maxiter
        break
    end
end
root = xr;
ea = ea
iter = iter
