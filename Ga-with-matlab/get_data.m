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

    Pr = 1750;
    Tr = 640;
    Pw = 100;
    Tw = 570;
    Psc = 14.7;
    Tsc = 520;
    Gs = 0.8;
    Ws = 1.07;
    Os = 0.85;
    wor = 1.5;
    wc = 0.6;
    g  = 32.16;
    gc = 32.16;
    D = 2.875 / 12;
    L = 4600;
    Z = 1;
    f = 0.002;
    Co = 1.2;
    Sl = 49.6;
    J = 2;

    W1 = well_data(Pr, Tr, Pw, Tw, Psc, Tsc, Gs, Ws, Os, ...
              wor, wc, g, gc, D, L, Z, f, Co, Sl, J);

    W1 = create_one(W1);

    % WELL 2

    Pr = 1850;
    Tr = 650;
    Pw = 100;
    Tw = 570;
    Psc = 14.7;
    Tsc = 520;
    Gs = 0.8;
    Ws = 1.07;
    Os = 0.85;
    wor = 7 / 3;
    wc = 0.7;
    g  = 32.16;
    gc = 32.16;
    D = 3 / 12;
    L = 5000;
    Z = 1;
    f = 0.002;
    Co = 1.2;
    Sl = 49.6;
    J = 2.5;

    W2 = well_data(Pr, Tr, Pw, Tw, Psc, Tsc, Gs, Ws, Os, ...
              wor, wc, g, gc, D, L, Z, f, Co, Sl, J);

    W2 = create_one(W2);

    % WELL 3

    Pr = 1900;
    Tr = 650;
    Pw = 100;
    Tw = 570;
    Psc = 14.7;
    Tsc = 520;
    Gs = 0.8;
    Ws = 1.07;
    Os = 0.85;
    wor = 4;
    wc = 0.8;
    g  = 32.16;
    gc = 32.16;
    D = 2 / 12;
    L = 5900;
    Z = 1;
    f = 0.002;
    Co = 1.2;
    Sl = 49.6;
    J = 3;

    W3 = well_data(Pr, Tr, Pw, Tw, Psc, Tsc, Gs, Ws, Os, ...
              wor, wc, g, gc, D, L, Z, f, Co, Sl, J);

    W3 = create_one(W3);

    % WELL 4

    Pr = 1850;
    Tr = 650;
    Pw = 100;
    Tw = 570;
    Psc = 14.7;
    Tsc = 520;
    Gs = 0.8;
    Ws = 1.07;
    Os = 0.85;
    wor = 7 / 3;
    wc = 0.7;
    g  = 32.16;
    gc = 32.16;
    D = 2 / 12;
    L = 5900;
    Z = 1;
    f = 0.002;
    Co = 1.2;
    Sl = 49.6;
    J = 3.7;

    W4 = well_data(Pr, Tr, Pw, Tw, Psc, Tsc, Gs, Ws, Os, ...
              wor, wc, g, gc, D, L, Z, f, Co, Sl, J);

    W4 = create_one(W4);

    % WELL 5

    Pr = 1800;
    Tr = 650;
    Pw = 100;
    Tw = 570;
    Psc = 14.7;
    Tsc = 520;
    Gs = 0.8;
    Ws = 1.07;
    Os = 0.85;
    wor = 1.5;
    wc = 0.8;
    g  = 32.16;
    gc = 32.16;
    D = 2 / 12;
    L = 5500;
    Z = 1;
    f = 0.002;
    Co = 1.2;
    Sl = 49.6;
    J = 2.5;

    W5 = well_data(Pr, Tr, Pw, Tw, Psc, Tsc, Gs, Ws, Os, ...
              wor, wc, g, gc, D, L, Z, f, Co, Sl, J);

    W5 = create_one(W5);

    % FULL

    data = create_full(W1, W2, W3, W4, W5);
end


