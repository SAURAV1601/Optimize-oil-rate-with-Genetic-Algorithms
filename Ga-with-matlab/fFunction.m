function f = fFunction(x)
	% Fitness function for multi-object optimize
	% 
	% PARAMETERS
	% 
	% 	FULL:			well data (type: struct)
	% 
	% KEYWORD ARGUMENTS
	% 
	% 	x:				liquid rate and gas injection rate vars (type: array)
	% 	x(1, 2, 3, 4):	qg1, qg2, qg3, qg4
	% 	x(5, 6, 7, 8):	ql1, ql2, ql3, ql4

	% GLOBAL VARIABLES
	% 
	% 	Pfunc:			penalty function
	% 	rk4:			Runge-Kutta 4th function
	% 
	% RETURNS
	% 
	% 	f:				fitness function

	global Pfunc;
	global rk4;
	global FULL


	wc1  = FULL.W1.WC;
	wc2  = FULL.W2.WC;
	wc3  = FULL.W3.WC;
	wc4  = FULL.W4.WC;
    wc5  = FULL.W5.WC;

	Pw1  = FULL.W1.Pw;
	Pr1  = FULL.W1.Pr;

	Pw2  = FULL.W2.Pw;
	Pr2  = FULL.W2.Pr;

	Pw3  = FULL.W3.Pw;
	Pr3  = FULL.W3.Pr;

	Pw4  = FULL.W4.Pw;
	Pr4  = FULL.W4.Pr;
    
    Pw5  = FULL.W5.Pw;
	Pr5  = FULL.W5.Pr;

	lb   = 10;

	f(1) = x(1) / ((1 - wc1) * x(6)) + ...
			lb * max(0, rk4(0, Pw1 / Pr1, 0, 0.01, Pfunc, x(1), x(6), FULL.W1));

	f(2) = x(2) / ((1 - wc2) * x(7)) + ...
			lb * max(0, rk4(0, Pw2 / Pr2, 0, 0.01, Pfunc, x(2), x(7), FULL.W2));

	f(3) = x(3) / ((1 - wc3) * x(8)) + ...
			lb * max(0, rk4(0, Pw3 / Pr3, 0, 0.01, Pfunc, x(3), x(8), FULL.W3));

	f(4) = x(4) / ((1 - wc4) * x(9)) + ...
			lb * max(0, rk4(0, Pw4 / Pr4, 0, 0.01, Pfunc, x(4), x(9), FULL.W4));
        
    f(5) = x(5) / ((1 - wc5) * x(10)) + ...
			lb * max(0, rk4(0, Pw5 / Pr5, 0, 0.01, Pfunc, x(5), x(10), FULL.W5));
end
