function f = fitAnother(x)
%   fitness function
% 
%   PARAMETERS
% 
% 
% 
%   KEYWORD ARGUMENTS
% 
%       x:          array
%       x(1:4):     gas injection rate
%       x(5:8):     liquid production rate
% 
%   RETURNS
% 
%       f:          fitness function
    
    global FULL;
    global rk4;
    global Pfunc;
    
    wc1  = FULL.W1.WC;
	wc2  = FULL.W2.WC;
	wc3  = FULL.W3.WC;
	wc4  = FULL.W4.WC;

	J1   = FULL.W1.J;
	J2   = FULL.W2.J;
	J3   = FULL.W3.J;
	J4   = FULL.W4.J;

	Pw1  = FULL.W1.Pw;
	Pr1  = FULL.W1.Pr;

	Pw2  = FULL.W2.Pw;
	Pr2  = FULL.W2.Pr;

	Pw3  = FULL.W3.Pw;
	Pr3  = FULL.W3.Pr;

	Pw4  = FULL.W4.Pw;
	Pr4  = FULL.W4.Pr;

	lb   = 10;
    
    f    = (x(1) + x(2) + x(3) + x(4)) / ...
            ((1 - wc1) * x(5) + (1 - wc2) * x(6) + ...
            (1 - wc3) * x(7) + (1 - wc4) * x(8)) + ...
            lb * max(0, rk4(0, Pw1 / Pr1, 0, 0.01, Pfunc, x(1), x(5), FULL.W1) ...
					- (1 - (x(5) / (J1 * Pr1)))) + ...
            lb * max(0, rk4(0, Pw2 / Pr2, 0, 0.01, Pfunc, x(2), x(6), FULL.W2) ...
					- (1 - (x(6) / (J2 * Pr2)))) + ...
            lb * max(0, rk4(0, Pw3 / Pr3, 0, 0.01, Pfunc, x(3), x(7), FULL.W3) ...
					- (1 - (x(7) / (J3 * Pr3)))) + ...
            lb * max(0, rk4(0, Pw4 / Pr4, 0, 0.01, Pfunc, x(4), x(8), FULL.W4) ...
					- (1 - (x(8) / (J4 * Pr4))));
end