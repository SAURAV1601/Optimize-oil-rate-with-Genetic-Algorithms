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

	c    = [];
%     c 	 = x(5) + x(6) + x(7) + x(8) - 1;
	c_eq = x(1) + x(2) + x(3) + x(4) - 1;
%             x(5) + x(6) + x(7) + x(8) - 0.1];

end