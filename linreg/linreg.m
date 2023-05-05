function [fX, fY, slope, intercept, Rsquared] = linreg(x,y)
% linreg computes the linear regression of a data set
%% Inputs:
% x - x-values for our data set
% y - y-values for our data set
% 
%% Outputs:
% fX - x-values with outliers removed
% fY - y-values with outliers removed
% slope - slope from the linear regression y=mx+b
% intercept - intercept from the linear regression y=mx+b
% Rsquared - R^2, a.k.a. coefficient of determination

%% Entry Check
if length(x) ~= length (y)
    error('Arrays x and y must be the same size')
end

%% Outlier Removal
%% Order y in increasing order, match x order
[y, sortOrder] = sort(y);
x = x(sortOrder);

% total number of paired data points
n_t = length(y);

% Calculate Quartiles and IQR, where Q1 and Q3 are quartiles, and IQR is the Interquartile range
Q1 = floor((n_t+1)/4);
Q3 = floor((3*n_t+3)/4);
IQR = y(Q3)-y(Q1);

% Cuts out outliers
lowcutout = y < (-1.5*IQR+y(Q1));
highcutout = y > (1.5*IQR+y(Q3));
cutout = lowcutout+highcutout ~= 0;
x(cutout) = [];
y(cutout) = [];
fX = x;
fY = y;

%% Linear Regression Statistics
% Basic statistics
n = length(fY);
sxy = sum(fX.*fY);
sx = sum(fX);
sy = sum(fY);
sx2 = sum(fX.^2);
sy2 = sum(fY.^2);

% slope and intercept
slope = ((n*sxy - sx*sy)/(n*sx2-sx^2));
intercept = sy/n- slope*sx/n;
% R^2
st = sum((fY-sy/n).^2);
sr = sum((fY - intercept - slope*fX).^2);
Rsquared = (st-sr)/st;

end
