function [I] = SimpsThird(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%% Error Checks
% Length check between variables
if length(x) ~= length(y)
    error('x and y must be the same length')
end
% Spacing Check
n = length(x);
h = x(2)-x(1);
for i = 2:n
    if x(i) - x(i-1) ~= h
        error('x input must be equally spaced')
    end
end

%% Integral Calculations
% Check if number of intervals of x is odd, and complete trap rule for the last interval if it is.
if mod(n-1,2) ~= 0
    warning('Input x has an odd number of intervals, trapezoidal rule will be used for the last interval')
    % Variable "trap" is the integral of the last interval approximated by the trap. rule
    trap = h*0.5*(y(n)+y(n-1));
    % The last value of y is removed to make the number of intervals even
    y = y(1:n-1);
    n = length(y);
else
    % Number of intervals is even, no need to do trap. rule
    trap = 0;
end
% Simpson's 1/3 rule for even n, and the addition of the trap. rule if applicable.
y_odd = y(2:2:n-1);
y_even = y(3:2:n-2);
I = h*(y(1)+y(n)+4*sum(y_odd)+2*sum(y_even))/3+trap;
end