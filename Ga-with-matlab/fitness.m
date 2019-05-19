function f = fitness(x)
f(1) = (x(1) + 2)^2 + (x(2) - 2)^2 + 10;
f(2) = 5*x(2) - x(1)^2;
end