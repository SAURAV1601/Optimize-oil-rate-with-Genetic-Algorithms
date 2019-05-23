function equation = penalty(qg, ql, z, P, WellData)
% Docstrings for cross_section_area
% 
% PAREMETER
% 	WellData = well data (type: struct)
% 
% KEYWORD ARGUMENTS
% 	qg = gas injection rate
% 	ql = liquid production rate
% 	P  = pressure loss	
% 	z  = depth of point
% 
% RETURNS
% 	equation = penalty equation.

	assert (isstruct(WellData), 'Invalid input well data.');
	assert (nargin == 5, 'Not enough keyword arguments');

	Pr   = WellData.Pr;
	f    = WellData.f;

	Dsc  = density_scaled(qg, ql, P, WellData);
	Vsc  = velocity_scaled(qg, ql, P, WellData);
	al   = alpha_function(WellData);
	Qgsc = gas_rate_scaled(qg, WellData);
	mo   = 1 + al * Dsc * Vsc * Qgsc / (P / Pr)^2;

	equation = z * Dsc * (1 + 0.5 * f * Vsc^2) / mo;
end

% ===========================================================

function A = cross_section_area(WellData)
% Docstrings for cross_section_area
% 
% PAREMETER
% 	WellData = well data (type: struct)
% 
% RETURNS
% 	A = cross sectional of tubing

	assert (isstruct(WellData), 'Invalid input well data.');

	D = WellData.D;

	A = pi * D^2 / 4;
end

function Usg = superficial_gas(qg, P, WellData)
% Docstrings for superficial_gas
% 	
% PARAMETERS
% 	WellData = well data (type: struct)
% 
% KEYWORD ARGUMENTS
% 	qg       = gas injection rate
% 	P        = pressure loss
% 
% RETURNS
% 	Usg = superficial of gas

	assert (isstruct(WellData), 'Invalid input well data.');
	assert (nargin == 3, 'Not enough keyword arguments.');

	Psc = WellData.Psc;
	Tsc = WellData.Tsc;
	Tw  = WellData.Tw;
	Tr  = WellData.Tr;
	Z   = WellData.Z;
	A   = cross_section_area(WellData);

	Usg = Z * Psc * ((Tw + Tr) / 2) * qg / (Tsc * P * A);
end

function Usl = superficial_liquid(ql, WellData)
% Docstrings for cross_section_area
% 
% PARAMETERS
% 	WellData = well data (type: struct)
% 
% KEYWORD ARGUMENTS
% 	ql		 = liquid production rate
% 
% RETURNS
% 	Usl = superficial of liquid

	assert (isstruct(WellData), 'Invalid input well data.');
	assert (nargin == 2, 'Not enough keyword arguments.');

	A   = cross_section_area(WellData);

	Usl = ql / A;
end

function Hg = gas_holdup(qg, ql, P, WellData)
% Docstrings for cross_section_area
% 
% PARAMETERS
% 	WellData = well data (type: struct)
% 
% KEYWORD ARGUMENTS
% 	qg 		 = gas injection rate
% 	ql		 = liquid production rate
% 	P        = pressure loss
% 
% RETURNS
% 	Hg = gas holdup

	assert (isstruct(WellData), 'Invalid input well data.');
	assert (nargin == 4, 'Not enough keyword arguments.');

	Co  = WellData.Co;
	Ud  = WellData.Ud;

	Usg = superficial_gas(qg, P, WellData);
	Usl = superficial_liquid(ql, WellData);
	Um  = Usg + Usl;

	Hg  = Usg / (Co * Um + Ud);
end

function Md = mixture_density(qg, ql, P, WellData)
% Docstrings for cross_section_area
% 
% PARAMETERS
% 	WellData = well data (type: struct)
% 
% KEYWORD ARGUMENTS
% 	qg 		 = gas injection rate
% 	ql		 = liquid production rate
% 	P        = pressure loss
% 
% RETURNS
% 	Md = mixture density of injection gas, oil, water

	assert (isstruct(WellData), 'Invalid input well data.');
	assert (nargin == 4, 'Not enough keyword arguments.');

	Gd = WellData.Ds.Gd;
	Ld = WellData.Ds.Ld;

	Hg = gas_holdup(qg, ql, P, WellData);

	Md = Hg * Gd + (1 - Hg) * Ld;
end

function Vsc = velocity_scaled(qg, ql, P, WellData)
% Docstrings for cross_section_area
% 
% PARAMETERS
% 	WellData = well data (type: struct)
% 
% KEYWORD ARGUMENTS
% 	qg = gas injection rate
% 	ql = liquid production rate
% 	P  = pressure loss
% 
% RETURNS
% 	Vsc = mixture velocity scaled

	assert (isstruct(WellData), 'Invalid input well data.');
	assert (nargin == 4, 'Not enough keyword arguments.');

	D   = WellData.D;
	g   = WellData.g;

	Usg = superficial_gas(qg, P, WellData);
	Usl = superficial_liquid(ql, WellData);
	Um  = Usg + Usl;

	Vsc = Um / (g * D);
end

function Dsc = density_scaled(qg, ql, P, WellData)
% Docstrings for density_scaled
% 
% PARAMETERS
% 	WellData = well data (type: struct)
% 
% KEYWORD ARGUMENTS
% 	qg = gas injection rate
% 	ql = liquid production rate
% 	P  = pressure loss
% 
% RETURNS
% 	Dsc = mixture density scaled

	assert (isstruct(WellData), 'Invalid input well data.');
	assert (nargin == 4, 'Not enough keyword arguments.');

	Pr  = WellData.Pr;
	L   = WellData.L;
	g   = WellData.g;
	gc  = WellData.gc;
	Md  = mixture_density(qg, ql, P, WellData);

	Dsc = Md * L * g / (gc * Pr);
end

function Qgsc = gas_rate_scaled(qg, WellData)
% Docstrings for density_scaled
% 
% PARAMETERS
% 	WellData = well data (type: struct)
% 
% KEYWORD ARGUMENTS
% 	qg = gas injection rate
% 
% RETURNS
% 	Qgsc = gas injection rate scaled

	assert (isstruct(WellData), 'Invalid input well data.');
	assert (nargin == 2, 'Not enough keyword arguments.');

	L = WellData.L;
	D = WellData.D;
	g = WellData.g;

	Qgsc = qg / (L * D * sqrt(g * D));
end

function al = alpha_function(WellData)
% Docstrings for density_scaled
% 
% PARAMETERS
% 	WellData = well data (type: struct)
% 
% KEYWORD ARGUMENTS
% 	qg = gas injection rate
% 
% RETURNS
% 	Qgsc = gas injection rate scaled

	assert (isstruct(WellData), 'Invalid input well data.');

	Pr  = WellData.Pr;
	Tr  = WellData.Tr;
	Psc = WellData.Psc;
	Tsc = WellData.Tsc;
	Tw  = WellData.Tw;
	Z   = WellData.Z;

	al = 4 * Z * ((Tw + Tr) / 2) * Psc / (pi * Tsc * Pr);
end

