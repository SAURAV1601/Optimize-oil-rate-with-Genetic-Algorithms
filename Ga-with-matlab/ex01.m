% global function

global Pfunc;
global rk4;
global FULL;

% import function

get =           @get_data;
well_data =     @input_data;
create_one =    @create_individual;
create_full =   @create_database;

fit     = @fFunction;
rk4     = @rk4th;
Pfunc   = @penalty;

% boundary condition

n_vars  = 8;
lower   = [0 0 0 0 0 0 0 0];
upper   = [0.5 0.5 0.5 0.5 1 1 1 1];
const   = @optConstraints;

% DO

FULL = get(well_data, create_one, create_full);

[x, fval] = gamultiobj(fit, n_vars, [], [], [], [], lower, upper, const);

