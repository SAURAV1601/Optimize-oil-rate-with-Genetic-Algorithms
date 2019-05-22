equation    = @penalty;
well_data   = @input_data;
create_one  = @create_individual;
create_full = @create_database;

Pr = 790;
Tr = 595;
Pw = 100;
Tw = 595;
Psc = 14.7;
Tsc = 520;
Gs = 0.65;
Ws = 1.08;
Os = 0.87;
wor = 1;
wc = 0.6;
g  = 32.16;
gc = 32.16;
D = 2.875 / 12;
L = 6900;
Z = 1;
f = 0.002;
Co = 1.08;
Ud = 1.47;

qg = 0.71147;
ql = 0.040501;
z  = 1;
P  = 0.12;

WellData = well_data(Pr, Tr, Pw, Tw, Psc, Tsc, Gs, Ws, Os, ...
          wor, wc, g, gc, D, L, Z, f, Co, Ud);
      
WellData = create_one(WellData);

full = create_full(WellData, WellData, WellData, WellData, WellData);

% deriv = equation(qg, ql, z, P, full.W1);

% disp(deriv)

% y = rk4(0, 100/790, 1, 0.01, equation, qg, ql, WellData);
