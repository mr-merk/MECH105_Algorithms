

syms x;
f=-exp(x) -0.5*x +6; % defining function f(x);
df=diff(f); % derivative of the function f(x);

x0=1; % initial guess for newton method;
tolerance=0.00001; % error tolerance for root;

X=x0;
NMAX=2; % maximum number of iterations;

N=0;
A(N+1,:)=[N X double(subs(f,x,X))]

while N<=NMAX && abs(double(subs(f,x,X)))>tolerance
N=N+1;
X=X-double(subs(f,x,X))/double(subs(df,x,X)) % calculating xn
A(N+1,:)=[N X double(subs(f,x,X))]; % storing the data;
end

% display the solution;
VarNames = {'Iteration','x','fx'};
TT=table(A(:,1),A(:,2),A(:,3), 'VariableNames',VarNames);
fprintf('\n\n')
disp(TT);
fprintf('Required solution is: %.6f',X);
fprintf('\n\n')
end