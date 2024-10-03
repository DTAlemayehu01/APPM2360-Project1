% Our Differential Equation, p=1.2 and q=1
function f = dy(y, L)
   f = 0.65*(1 - y/L)*y - (1.2*y^2)/(1 + y^2);
end

% Generates the Euler Sequence from y_0 to y_n
function f = y_n(y_0, term_count, h, L)
    f = [y_0];
    yn = y_0;
    for i = 1:term_count
        yn =  yn + h*dy(yn,L);
        f = [f yn];
    end
end

% Constants

% Euler Step-Size
h = 0.01;
% Carrying capacities
L = [5.4 8.1 16.3];
% Inital Fish Populations
y_0 = [50, 100, 200, 2000];

% number of terms in the Euler sequence
count = 80/h;

% domain of interest (parameterized by t months)
t_space = linspace(0, 80, 80/h + 1); 

figure(1)
% Fish population at given t
y_space = [];
legend_space = [];
for i = 1:3
    y_space = [y_space; y_n(y_0(1), count, h, L(i))];
    legend_space = [legend_space; sprintf("L = %.1f", L(i))];
end
plot(t_space, y_space);
legend(legend_space);
grid


figure(2)
% Fish population at given t
y_space = [];
legend_space = [];
for i = 1:3
    y_space = [y_space; y_n(y_0(2), count, h, L(i))];
    legend_space = [legend_space; sprintf("L = %.1f", L(i))];
end
plot(t_space, y_space);
legend(legend_space);
grid

figure(3)
% Fish population at given t
y_space = [];
legend_space = [];
for i = 1:3
    y_space = [y_space; y_n(y_0(3), count, h, L(i))];
    legend_space = [legend_space; sprintf("L = %.1f", L(i))];
end
plot(t_space, y_space);
legend(legend_space);
grid

figure(4)
% Fish population at given t
y_space = [];
legend_space = [];
for i = 1:3
    y_space = [y_space; y_n(y_0(4), count, h, L(i))];
    legend_space = [legend_space; sprintf("L = %.1f", L(i))];
end
plot(t_space, y_space);
legend(legend_space);
grid