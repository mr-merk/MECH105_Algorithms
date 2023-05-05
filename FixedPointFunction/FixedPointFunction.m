function [x1, iter, ea] = FixedPointFunction(g,x0,es,maxiter)
% A custom function designed to solve for the root of a function using the
% fixed point method, with x = g(x)
% 
%% Inputs
% g - x=g(x) of which root you need to find
% x0 - initial guess for x
% es - stopping criterion in %(0.1% if not specified)
% maxiter - max iterations before stopping (200 if not specified)
%
%% Outputs
% x1 - calculated root
% iter - number of iterations
% ea - approximate error


if nargin < 4
      maxiter = 200;
end
if nargin < 3
    es = 0.1;
end

iter = 0; 
ea = 100;

while (1)
    x1 = g(x0);
    iter = iter + 1;
    if x1 ~= 0
        ea = abs((x1-x0)/x1)*100;
    end
    if ea <= es || iter == maxiter
        break
    end
    x0 = x1;
end

