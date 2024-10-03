function y = logistic_curve(L, y_0, r, t)
    y = L ./ (1 + (L/y_0 - 1)*exp((-r*t)));
end

%Conditions
%Rainbow, Brown, Brook (in hundreds of fish)
capacity = [5.4 8.1 16.3];

t_space = linspace(0, 15, 200);
ics_y = 1; %in hundreds
growth_rate = 0.65;

% y_space = [logistic_curve(capacity(1), ics_y, growth_rate, t_space), 
%     logistic_curve(capacity(2), ics_y, growth_rate, t_space),
%     logistic_curve(capacity(3), ics_y, growth_rate, t_space)];

y_space = [];

for i = 1:3
    new_y = logistic_curve(capacity(i), ics_y, growth_rate, t_space);
    y_space = [y_space; new_y];
end

plot(t_space, y_space);

legend('Rainbow Trout', 'Brown Trout', 'Brook Trout');