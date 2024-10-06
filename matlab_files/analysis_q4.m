clear;
clc;
close all;

%% b.)

%% (i) f(y) plots for each trout type at limiting value

%eq_3 => f(y) = r(1-y/L)y - (py^2)/(q+y^2)
%eq_1 = r*(1-y/l)*y-(h_y);
%eq_2 = (py^2)/(q+y^2)
% parameters representing how well locals catch fish
p = 1.2;
q = 1;
% r = intrinsic growth rate
r = 0.65;
% L = carrying capacity
browntroutL = 8.1;
brooktroutL = 16.3;
rainbowtroutL = 5.4;

%interval for which f(y) is calculated 
y = (0:15);

%dy = r*(1-(y./L))*y - (p*y.^2)/(q+y.^2);
%y' for the brown trout at limiting value
dy_browntrout = @(y) r*(1 - (y / browntroutL)).*y - (p.*(y.^2))/(q + y.^2);

%y' for the brook trout at limiting value
dy_brooktrout =  @(y) r*(1 - (y / brooktroutL)).*y - (p.*(y.^2))/(q + y.^2);

%y' for the rainbow trout at limiting value
dy_rainbowtrout =  @(y) r*(1 - (y / rainbowtroutL)).*y - (p.*(y.^2))/(q + y.^2);


figure();
hold on;
%plots f(y) as a function of y for each trout type with limiting capacity
fplot(dy_browntrout, [0 15]);
fplot(dy_brooktrout, [0 15]);
fplot(dy_rainbowtrout, [0 15]);

title('Trout Population Growth Rate vs Trout Population')
xlabel('Trout Population (in hundreds)');
ylabel('Rate of Trout Population Growth (hundreds per month)')
legend('Brown Trout',  'Brook Trout', 'Rainbow Trout', 'location', 'southwest');

hold off;
%{
Based on the graph of f(y) for each of the fish, the equilibrium
solutions can be found in the intervals as follows. 
The 4 brown trout equilibrium solutions can be found at 0, in between 0.5-1, 1.5-4, and
4.5-15.
The 2 brook trout equilibrium solutions can be found at 0, and between 14-15
The 2 rainbow trout equilibrium solutions can be found at 0 and between 0.5-1

***NOTE*** I dont think this needs to be in the code, but rather in the
write up, I left it just in case but either of us can remove it if need be

%}

%% (ii) Equilibrium Solutions

%Finds equilibrium solutions for brown trout in each of the intervals where they occur
fun_BNT = @(y) r.*(1-(y/browntroutL)).*y - (p.*y.^2)/(q+y.^2);
equil_solns_BNT = [];
equil_solns_BNT(1) = fzero(fun_BNT, [0 1]);
equil_solns_BNT(2) = fzero(fun_BNT, [0.5 1]);
equil_solns_BNT(3) = fzero(fun_BNT, [1.5 4]);
equil_solns_BNT(4) = fzero(fun_BNT, [4.5 15]);


%Finds equilibrium solutions for brook trout in each of the intervals where they occur
fun_BKT = @(y) r.*(1-(y./brooktroutL)).*y - (p.*y.^2)/(q+y.^2);
equil_solns_BKT = [];
equil_solns_BKT(1) = fzero(fun_BKT, 0);
equil_solns_BKT(2) = fzero(fun_BKT, [1 15]);

%Finds equilibrium solutions for rainbow trout in each of the intervals where they occur
fun_RT = @(y) r.*(1-(y./rainbowtroutL)).*y - (p.*y.^2)/(q+y.^2);
equil_solns_RT = [];
equil_solns_RT(1) = fzero(fun_RT, 0);
equil_solns_RT(2) = fzero(fun_RT, [.5 3]);


%% (iii) Direction Fields

%eq_1 = r*(1-y/l)*y-(h_y);
%eq_2 = (py^2)/(q+y^2)

%Direction field of eq 1 and 2 for the brown trout
f_BNT = @(t,y) 0.65*(1-y/8.1)*y - (1.2*y^2)/(1+y^2);

%Direction field of eq 1 and 2 for the brook trout
f_BKT = @(t,y) 0.65*(1-y/16.3)*y - (1.2*y^2)/(1+y^2);

%Direction field of eq 1 and 2 for rainbow trout
f_RT = @(t,y) 0.65*(1-y/5.4)*y - (1.2*y^2)/(1+y^2);

%Direction field for Brown Trout with equilibrium solutions
figure();
dirfield(f_BNT, 0:1.5:60, -5:1.5:20, equil_solns_BNT);
title('Brown Trout Direction Field w/ Equil. Solns');
%Direction field for Brook Trout with equilibrium solutions
figure();
dirfield(f_BKT, 0:1.5:60, -5:1.5:20, equil_solns_BKT);
title('Brook Trout Direction Field w/ Equil. Solns');
%Direction field for Rainbow Trout with equilibrium solutions
figure();
dirfield(f_RT, 0:1.5:60, -5:1.5:20, equil_solns_RT);
title('Rainbow Trout Direction Field w/ Equil. Solns');


%% Function Def'n
function dirfield(f,tval,yval,x)
[tm,ym] = meshgrid(tval,yval);
dt = tval(2) - tval(1);
dy = yval(2) - yval(1);
fv = vectorize(f);
if isa(f,'function_handle')
fv = eval(fv);
end
yp = feval(fv,tm,ym);
s = 1./max(1/dt,abs(yp)./dy)*0.35;
h = ishold;
quiver(tval,yval,s,s.*yp,0,'.r'); hold on;
quiver(tval,yval,-s,-s.*yp,0,'.r');
if h
hold on
else
hold off
end
axis([tval(1)-dt/2,tval(end)+dt/2,yval(1)-dy/2,yval(end)+dy/2])
xlabel('Time (months)');
ylabel('Trout Population (in hundreds)');
yline(x, 'k', 'LineWidth', 1.2);
end
