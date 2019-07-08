function data = get_data(well_data, create_one, create_full)
%     Function to get well data
% 
%   PARAMETERS
% 
%       well_data:      function create initially well data
%       create_one:     function create individual well data
%       create_full:    function create full of data for cluster well
% 
%   RETURNS
%       
%       data:           full database (type: struct)

    % WELL 1

    Pr = 3900;
    Tr = 684.27;
    Pw = 278.7;
    Tw = 641.41;
    Psc = 14.7;
    Tsc = 520;
    Gs = 0.7;
    Ws = 1.02;
    Os = 0.84;
    wor = 7.84;
    wc = 0.87;
    g  = 32.16;
    gc = 32.16;
    D = 4.5 / 12;
    L = 8891;
    Z = 1;
    f = 0.002;
    Co = 1.2;
    Sl = 49.6;
    J = 3;

    W1 = well_data(Pr, Tr, Pw, Tw, Psc, Tsc, Gs, Ws, Os, ...
              wor, wc, g, gc, D, L, Z, f, Co, Sl, J);

    W1 = create_one(W1);

    % WELL 2

    Pr = 3900;
    Tr = 684.27;
    Pw = 248.14;
    Tw = 631.58;
    Psc = 14.7;
    Tsc = 520;
    Gs = 0.7;
    Ws = 1.02;
    Os = 0.84;
    wor = 2.18;
    wc = 0.69;
    g  = 32.16;
    gc = 32.16;
    D = 4.5 / 12;
    L = 8891;
    Z = 1;
    f = 0.002;
    Co = 1.2;
    Sl = 49.6;
    J = 4.5;

    W2 = well_data(Pr, Tr, Pw, Tw, Psc, Tsc, Gs, Ws, Os, ...
              wor, wc, g, gc, D, L, Z, f, Co, Sl, J);

    W2 = create_one(W2);

    % WELL 3

    Pr = 3900;
    Tr = 684.27;
    Pw = 264.1;
    Tw = 650;
    Psc = 14.7;
    Tsc = 520;
    Gs = 0.7;
    Ws = 1.02;
    Os = 0.84;
    wor = 0.83;
    wc = 0.45;
    g  = 32.16;
    gc = 32.16;
    D = 4.5 / 12;
    L = 8891;
    Z = 1;
    f = 0.002;
    Co = 1.2;
    Sl = 49.6;
    J = 9;

    W3 = well_data(Pr, Tr, Pw, Tw, Psc, Tsc, Gs, Ws, Os, ...
              wor, wc, g, gc, D, L, Z, f, Co, Sl, J);

    W3 = create_one(W3);

    % WELL 4

    Pr = 3900;
    Tr = 684.27;
    Pw = 223.19;
    Tw = 603;
    Psc = 14.7;
    Tsc = 520;
    Gs = 0.7;
    Ws = 1.02;
    Os = 0.84;
    wor = 33.69;
    wc = 0.97;
    g  = 32.16;
    gc = 32.16;
    D = 4.5 / 12;
    L = 8891;
    Z = 1;
    f = 0.002;
    Co = 1.2;
    Sl = 49.6;
    J = 2.3;

    W4 = well_data(Pr, Tr, Pw, Tw, Psc, Tsc, Gs, Ws, Os, ...
              wor, wc, g, gc, D, L, Z, f, Co, Sl, J);

    W4 = create_one(W4);

    % FULL

    data = create_full(W1, W2, W3, W4);
    
    % Condition
    
    con1 = struct();
    con1.upper = [1 1 1 1 0.1 0.11 0.1 0.1];
    con1.lower = [0 0 0 0 0   0    0   0];
    
    con2 = struct();
    con2.upper = [1 1 1 1 0.07 0.077 0.07 0.07];
    con2.lower = [0 0 0 0 0    0    0    0];
    
    con3 = struct();
    con3.upper = [0.1 1 1   0.3 0.04 0.02 0.02 0.02];
    con3.lower = [0   0 0.5 0.1   0    0     0    0];
    
    data.cons.con1 = con1;
    data.cons.con2 = con2;
    data.cons.con3 = con3;
end


