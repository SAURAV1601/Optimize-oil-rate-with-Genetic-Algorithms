function get_value(func, x)
for c = 1:length(x)
    y = func(x(c, :));
    disp(sum(y));
    disp(func(x(c, :)));
end
end