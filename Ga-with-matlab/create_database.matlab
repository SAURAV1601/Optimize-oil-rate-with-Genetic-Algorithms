function DB = create_database(well1, varargin)
% This function create full data of all well
% 
% PARAMETERS
% 
% KEYWORD ARGUMENTS
% 
% 	well_n = well data (type: struct)
% 
% RETURNS
% 
% 	DB = full database

	assert (nargin > 0, 'There is no well data for optimize.');
	assert (isstruct(well1), 'Invalid input data for well 1.');

	DB    = struct();
	DB.W1 = well1;

	if nargin > 5
		error('Does not support yet!');
	end

	if nargin > 1
		well2 = varargin{1};
		assert (isstruct(well2), 'Invalid input data for well 2.');
		DB.W2 = well2;

		if nargin > 2
			well3 = varargin{2};
			assert (isstruct(well3), 'Invalid input data for well 3.');
			DB.W3 = well3;

			if nargin > 3
				well4 = varargin{3};
				assert (isstruct(well4), 'Invalid input data for well 4.');
				DB.W4 = well4;

				if nargin > 4
					well5 = varargin{4};
					assert (isstruct(well5), 'Invalid input data for well 5.');
					DB.W5 = well5;
				end
			end
		end
	end
end