function [c, c_eq] = optConstraints(x)
	% This function include all constraint for optimize
	% 
	% KEYWORD ARGUMENTS
	% 
	% 	x:		liquid rate and gas injection rate (type: struct)
	% 
	% RETURNS
	% 
	% 	c:		inequalities constraints
	% 	c_eq:	equalities constraints

	c 	 = [];
	c_eq = x(1) + x(2) + x(3) + x(4) + x(5) - 0.4; ...
%             x(6) + x(7) + x(8) + x(9) + x(10) - 1.17];

end