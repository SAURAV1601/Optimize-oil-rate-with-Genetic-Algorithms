function [c, c_eq] = fConstraints(x)
c    = [];
c_eq = [x(1) + x(2) + x(3) + x(4) + x(5) - 0.4;...
        x(6) + x(7) + x(8) + x(9) + x(10) - 1.17];
end