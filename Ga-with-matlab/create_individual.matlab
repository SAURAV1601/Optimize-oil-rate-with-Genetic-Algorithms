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
end

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