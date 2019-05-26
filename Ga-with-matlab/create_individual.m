function WellData = create_individual(WellData)
% Docstrings for create_individual
% 
% PARAMETERS
% 	WellData = well data (type: struct)
% KEYWORD ARGUMENTS
% 	WellData = well data (type: struct)

	assert (isstruct(WellData), 'Invalid input well data.');

	Gd = gas_density(WellData);
	Ld = liquid_density(WellData);

	WellData.Ds.Gd = Gd;
	WellData.Ds.Ld = Ld;
    
    Ud = drift_flux(WellData);
	WellData.Ud    = Ud;
end

% ===================================================================
% Subfunction

function Gd = gas_density(WellData)
% Docstrings for gas_density
% 
% PARAMETERS
% 	WellData = well data (type: struct)
% 
% RETURNS
% 	Gd = gas density

	assert (isstruct(WellData), 'Invalid input well data.');

	Gs  = WellData.Gs;
	Pr  = WellData.Pr;
	Tr  = WellData.Tr;

	Gd = 28.97 * Gs * Pr / (10.73 * Tr);
end

function Ld = liquid_density(WellData)
% Docstrings for liquid_density
% 
% PARAMETERS
% 	WellData = well data (type: struct)
% 
% RETURNS
% 	WellData = well data (type: struct)

	assert (isstruct(WellData), 'Invalid input well data.');

	Od  = WellData.Ds.Od;
	Wd  = WellData.Ds.Wd;
	WOR = WellData.WOR;

	Ld  = (Od + WOR * Wd) / (WOR + 1);
end

function Ud = drift_flux(WellData)
	% Function to calculate drift flux function
	% 
	% PARAMETERS
	% 
	% 	WellData:	individual well data (type: struct)
	% 
	% RETURNS
	% 
	% 	Ud:			drift flux velocity.

	assert (isstruct(WellData), 'Invalid input well data.');

	Sl = WellData.Sl;
	Gd = WellData.Ds.Gd;
	Ld = WellData.Ds.Ld;
	g  = WellData.g;

	Ud = 1.53 * ((g * Sl * (Ld - Gd)) / Ld^2)^(1/4);
end