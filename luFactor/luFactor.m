function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivoting 
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

%% Input Validity Check
[nRows,mCols] = size(A)
if nRows~=mCols
    error('Coefficient Matrix must be a square matrix')
end

%% Initial Matrix Setup
P = eye(nRows,mCols);
L = eye(nRows,mCols);
U = A;
s = nRows;

%% L, U, and P calculation loops
for i = 1:s-1
    % Pivot Section, Finds max of all the elements, swaps to place on top, 
    % then finds the new max of the remaining series, swaps, and so on.
    
    % Finds the row with the largest absolute value in the column of 
    % interest in the current section of rows
    [~,pivot] = max(abs(U(i:s,i)));
    pivot = pivot + i - 1;

    % Swap the current row with the row containing the max element
    % Does not swap if the max is the same as the row being replaced.
    if pivot ~= i 
        % Swaps U rows
        U([i,pivot],i:s) = U([pivot,i],i:s);
        % Reflects pivot in pivot matrix
        P([i,pivot],:) = P([pivot,i],:);
        % Reflects pivot in the L matrix
        L([i,pivot],1:i-1) = L([pivot,i],1:i-1);
    end

    %% Compute the coefficients and update U and L accordingly
    for j = i+1:s
        % Calculates coefficient to complete one step of Gauss elimination.
        coef = U(j,i) / U(i,i);
        % Stores coefficient in the L matrix corresponding to the element
        % cancelled out
        L(j,i) = coef;
        % Uses coefficient to complete one step of Gauss elimination.
        U(j,i:s) = U(j,i:s) - coef * U(i,i:s);
        % Loop repeats to complete elimination for the next row.
    end
end
end