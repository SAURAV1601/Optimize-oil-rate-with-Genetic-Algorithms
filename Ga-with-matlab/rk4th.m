function P = rk4th(z0, P0, z, h, ...
                            derivfun, qg, ql, welldata)
% RK4 Implements fixed step size 4th order Runge-Kutta
%
% This function implements a 4th order Runge-Kutta integration with a fixed
% step size.  It will integrate a set of n equations.
%
% KEYWORD ARGUMENTS
%
%   z0       = n x 1 array of starting values
%   P0       = scalar, starting x value
%   z        = scalar, ending x value
%   h        = scalar, step size
%   derivfun = derivative function
%   qg       = gas injection rate
%   ql       = liquid production rate
%   welldata = well data
%
% RETURNS
%
%   P = output values of integrated function

P = P0;

while true
    
    k1 = h * derivfun(qg, ql, z0,       P,        welldata);
    k2 = h * derivfun(qg, ql, z0 + h/2, P + k1/2, welldata);
    k3 = h * derivfun(qg, ql, z0 + h/2, P + k2/2, welldata);
    k4 = h * derivfun(qg, ql, z0 + h,   P + k3,   welldata);
    
    % update P
    P = P + (1.0 / 6.0) * (k1 + 2 * k2 + 2 * k3 + k4);
    
    % update z
    z0 = z0 + h;
    
    if z0 >= z
        break
    end
end
end
