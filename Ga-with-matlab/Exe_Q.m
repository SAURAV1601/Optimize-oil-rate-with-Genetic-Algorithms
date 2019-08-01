% global function

global Pfunc;
global rk4;
global FULL;

% import function

get         = @get_data;
well_data   = @input_data;
create_one  = @create_individual;
create_full = @create_database;

fit     = @fitAnother;
rk4     = @rk4th;
Pfunc   = @penalty;

% boundary condition

n_vars  = 8;
const   = @optConstraints;

% DO

FULL = get(well_data, create_one, create_full);

lower   = FULL.cons.con1.lower;
upper   = FULL.cons.con1.upper;

options = gaoptimset(@gamultiobj);
options.PopulationSize = 100;

[x, fval] = gamultiobj(fit, n_vars, [], [], [], [], lower, upper, const);

