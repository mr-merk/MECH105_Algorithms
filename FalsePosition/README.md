# False Position
A custom MATLAB function designed to solve for the root of a function using the
False Position method.<brk />

[root, fx, ea, iter] = FalsePosition(func, xl, xu, es, maxit)<brk />

Inputs:
- func - function of which root you need to find
- xl - lower bound on the root x values
- xu - upper bound on the root x values
- es - stopping criterion in % (0.1% if not specified)
- maxit - max iterations before stopping (200 if not specified)<brk />

Outputs:
- root - calculated root
- fx - function evaluated at root location
- ea - approximate error
- iter - number of iterations
