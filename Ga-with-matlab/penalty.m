function eq = penalty(qg, ql, z, P, sg_gas, Pr, Tr, rho_oil, wor, ...
                    rho_water, Z, Psc, Twh, D, Co, ...
                    Ud, gc, g, L, Tsc, f)
rho   = density_scaled(sg_gas, Pr, Tr, rho_oil, wor, ...
                    rho_water, qg, ql, P, Z, Psc, Tsc, Twh, D, Co, ...
                    Ud, gc, g, L);
                
Vsc   = velocity_scaled(qg, ql, P, Z, Psc, Tsc, Twh, D, g);
alpha = alpha_func(Pr, Twh, Psc, Tsc);
Qg_sc = gas_rate_scaled(qg, L, D, g);

u     = 1 + alpha * rho * Vsc * Qg_sc / ...
            (P / Pr)^2;
eq    = z * rho * (1 + 0.5 * f * Vsc^2) / u;
end

% ===========================================================

function rho = gas_density(sg_gas, Pr, Tr)
rho = 28.97 * sg_gas * Pr / (10.73 * Tr);
end

function rho = liquid_density(rho_oil, wor, rho_water)
rho = (rho_oil + wor * rho_water) / (wor + 2);
end

function A = cross_section_area(D)
A = pi * D^2 / 4;
end

function u = superficial_gas(qg, P, Z, Psc, Tsc, Twh, D)
A = cross_section_area(D);
u = Z * Psc * Twh * qg / (Tsc * P * A);
end

function u = superficial_liquid(ql, D)
A = cross_section_area(D);
u = ql / A;
end

function Hg = gas_holdup(qg, ql, P, Z, Psc, Tsc, Twh, D, Co, Ud)
Usg = superficial_gas(qg, P, Z, Psc, Tsc, Twh, D);
Usl = superficial_liquid(ql, D);
Um  = Usg + Usl;

Hg  = Usg / (Co * Um + Ud);
end

function rho = mix_density(sg_gas, Pr, Tr, rho_oil, wor, rho_water, ...
                                qg, ql, P, Z, Psc, Tsc, Twh, D, Co, Ud)
rho_gas    = gas_density(sg_gas, Pr, Tr);
rho_liquid = liquid_density(rho_oil, wor, rho_water);

Hg         = gas_holdup(qg, ql, P, Z, Psc, Tsc, Twh, D, Co, Ud);

rho        = Hg * rho_gas + (1 - Hg) * rho_liquid;
end

function Vsc = velocity_scaled(qg, ql, P, Z, Psc, Tsc, Twh, D, g)
Usg = superficial_gas(qg, P, Z, Psc, Tsc, Twh, D);
Usl = superficial_liquid(ql, D);
Um  = Usg + Usl;

Vsc = Um / (g * D);
end

function rho_sc = density_scaled(sg_gas, Pr, Tr, rho_oil, wor, ...
                    rho_water, qg, ql, P, Z, Psc, Tsc, Twh, D, Co, ...
                    Ud, gc, g, L)
rho    = mix_density(sg_gas, Pr, Tr, rho_oil, wor, rho_water, ...
                                qg, ql, P, Z, Psc, Tsc, Twh, D, Co, Ud);

rho_sc = rho * L * g / (gc * Pr);
end

function Qg_sc = gas_rate_scaled(qg, L, D, g)
Qg_sc = qg / (L * D * sqrt(g * D));
end

function alpha = alpha_func(Pr, Twh, Psc, Tsc)
alpha = 4 * Twh * Psc / (pi * Tsc * Pr);
end


















