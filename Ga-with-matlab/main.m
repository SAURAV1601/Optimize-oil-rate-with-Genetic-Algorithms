fit = @fitness;
n_vars  = 2;
lower   = [0 0];
upper   = [5 5];
const   = @constraints;

[x, fval] = gamultiobj(fit, n_vars, [], [], [], [], lower, upper, const);