# Bisection Function
A custom MATLAB function designed to solve for the root of a function using the
bisection method. Contains an error check to see if initial guesses are valid.<br />

[root, iter, ea] = BisectionFunction(func,xl,xu,es,maxiter)<br />

Inputs:
- func - function of which root you need to find
- xl - lower bound on the root x values
- xu - upper bound on the root x values
- es - stopping criterion in % (0.1% if not specified)
- maxiter - max iterations before stopping (200 if not specified)<br />

Outputs
- root - calculated root
- iter - number of iterations
- ea - approximate error
