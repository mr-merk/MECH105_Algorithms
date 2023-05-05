function [root, fx, ea, iter] = FalsePosition(func, xl, xu, es, maxit)
% A custom function designed to solve for the root of a function using the
% False Position method.
% 
%% Inputs
% func - function of which root you need to find
% xl - lower bound on the root x values
% xu - upper bound on the root x values
% es - stopping criterion in % (0.1% if not specified)
% maxit - max iterations before stopping (200 if not specified)
%
%% Outputs
% root - calculated root
% fx - function evaluated at root location
% ea - approximate error
% iter - number of iterations

%% Tests Input Viability
% Checks to see if es and maxit have been specified, also checks if minimum of 3 inputs present
if nargin < 3
    error('Not enough input arguments.')
elseif nargin < 4
    maxit = 200;
    es = 0.0001;
elseif nargin < 5
    maxit = 200;
end
% Checks for sign change between initial guesses
test = func(xl) * func(xu);
if test > 0
    error('No sign change, check bounds and/or function')
end

%% loop setup and iteration loop
% loop setup
iter = 0; 
xr = xl; 
ea = 100;

% iteration loop
while ea > es && iter < maxit
    % Denotes current root estimate as former root estimate to allow for approximate error calculation
    xrold = xr;
    % Counts iterations
    iter = iter + 1;
    % Estimates new root
    xr = (xu*func(xl)-xl*func(xu))/(func(xl)-func(xu));
    % Evaluates function at current estimated root
    fx = func(xr);
    
    % Calculates approximate error of current estimated root
    if xr ~= 0
        ea = abs((xr-xrold)/xr)*100;
    else % Error cannot be calculated when xr is 0 (Divide by 0), and signs cannot change if xr replaces a bound.
        % Therefore the program cannot continue iterations and the root will be displayed as 0.
        ea = 0;
    end
    
    % Tests root function, replaces upper or lower bound depending on estimate
    test = func(xl) * fx;
    if test < 0 % Sign change between lower and new estimate, xr replaces upper estimate
        xu = xr;
    elseif test > 0 % No sign change between lower and new estimate, xr replaces lower estimate
        xl = xr;
    end
end
root = xr;
end
