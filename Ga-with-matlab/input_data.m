function Wd = input_data(Pr, Tr, Pw, Tw, Psc, Tsc, Gs, Ws, Os, ...
							  wor, wc, g, gc, D, L, Z, f, Co, Ud)
% Doc strings for input_data
% 
% KEYWORD ARGUMENTS
% 	Pr  = reservoir pressure
% 	Tr  = reservoir temperature
% 	Pw  = well head pressure
% 	Tw  = well head temperature
% 	Psc = standard pressure
% 	Tsc = standard temperature
% 	Gs  = gas specific gravity
% 	Ws  = water specific gravity
% 	Os  = oil specific gravity
% 	wor = water oil ratio
% 	wc  = water cut
% 	g   = gravity acceleration
% 	gc  = conversation
% 	D   = tubing diameter
% 	L   = well depth
% 	Z   = gas compressibility factor
% 	f   = friction factor
% 	Co  = distribution factor
% 	Ud  = drift flux velocity
% 
% RETURNS
% 	Wd = Well data (type: struct)
% 	Ds = Density

	Wd = 62.37;
	Od = Wd * Os;

	Ds = struct('Wd', Wd, ...
				'Od', Od);

	Wd = struct('Pr',  Pr,  'Tr',  Tr, ...
				'Pw',  Pw,  'Tw',  Tw, ...
				'Psc', Psc, 'Tsc', Tsc, ...
				'Gs',  Gs,  'Ws',  Ws, 'Os',  Os, ...
				'WOR', wor, 'WC',  wc, ...
				'g',   g,   'gc',  gc, ...
				'D',   D,   'L',   L,  'Z',   Z, ...
				'f',   f,   'Co',  Co, 'Ud',  Ud, ...
				'Ds',  Ds);
end