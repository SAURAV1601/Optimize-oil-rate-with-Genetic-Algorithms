Pe = @penalty;

qg = 0.71147;
ql = 0.040501;
z  = 1;
P  = 0.12;
sg_gas = 0.65;
Pr = 790;
Tr = 595;
rho_oil = 54.6;
wor = 1;
rho_water = 62.17;
Z = 1;
Psc = 14.7;
Twh = 595;
D = 2.875 / 12;
Co = 1.08;
Ud = 1.47;
gc = 32.16;
g = gc;
L = 6900;
Tsc = 520;
f = 0.002;

eq = Pe(qg, ql, z, P, sg_gas, Pr, Tr, rho_oil, wor, ...
                    rho_water, Z, Psc, Twh, D, Co, ...
                    Ud, gc, g, L, Tsc, f);
disp(eq);
