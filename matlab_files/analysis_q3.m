function f = harvest_function(y, p, q)
    numerator = p*y.^2;
    denominator = q + y.^2;
    %f = (p*y.^2)./(q + y.^2);
    f = numerator./denominator;
end


% Conditions

% Consider the cartesian product of the two sets
p_space = [1 1.5 2];
q_space = [1 1.5 2];
% Thus we have our ordered pairs of curve constants
[P,Q] = meshgrid(p_space,q_space);
paring_count = numel([P(:)]);
% Y Range
y_space = linspace(0,10,200);

result_space = [];
for i = 1:paring_count
    h_y = harvest_function(y_space, P(i), Q(i));
    result_space = [result_space; h_y];
end

plot(y_space, result_space);


legend_space = [];
for i = 1:paring_count
    name = sprintf("(%.1f, %.1f)", P(i), Q(i));
    legend_space = [legend_space name];
end

legend(legend_space);

