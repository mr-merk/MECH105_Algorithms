# Fixed Point

A custom MATLAB function designed to solve for the root of a function using the
fixed point method, with x = g(x)<brk />

[x1, iter, ea] = FixedPointFunction(g,x0,es,maxiter)<brk />

Inputs:
- g - x=g(x) of which root you need to find
- x0 - initial guess for x
- es - stopping criterion in %(0.1% if not specified)
- maxiter - max iterations before stopping (200 if not specified)<brk />

Outputs:
- x1 - calculated root
- iter - number of iterations
- ea - approximate error
