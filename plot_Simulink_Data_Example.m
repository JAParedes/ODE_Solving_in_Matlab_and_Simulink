%% Getting Simulink data to Matlab workspace and plotting solutions for comparison

close all
clear all
clc

%% Problem setup

A = -1;
B = 1;
C = 1;
D = 0;

x0 = 2;
t = 0:0.01:10;

U = 5.*(t>=1); %Step function
ssSym = ss(A, B, C, D);

%% Numerical solution - ode45
[~,xxODE45] = ode45(@(t,x)odefun(t, x), t, x0);
yyODE45 = C*xxODE45 + D*(5.*(t>=1));

%% Numerical solution - lsim
[yyLSIM,~,xxLSIM] = lsim(ssSym,U,t,x0);

%% Numerical solution - Simulink
simout = sim('simulink_Plot');

ttSim = simout.tt;
yySimulink1 = simout.yySimulink1;
yySimulink2 = simout.yySimulink2;
yySimulink3 = simout.yySimulink3;

%% Plotting solutions
figure(1)

plot(t, yyODE45, 'linewidth', 2)
hold on
plot(t, yyLSIM, '-.', 'linewidth', 2)
plot(ttSim, yySimulink1, '--', 'linewidth', 2)
hold off
xlabel('$t$ (s)','interpreter','latex','fontsize',14)
ylabel('$y (t)$','interpreter','latex','fontsize',14)
legend({'ode45','lsim','Simulink'}, 'interpreter','latex','fontsize',11)
grid on

figure(2)

plot(ttSim, yySimulink1, 'linewidth', 2)
hold on
plot(ttSim, yySimulink2, '-.', 'linewidth', 2)
plot(ttSim, yySimulink3, '--', 'linewidth', 2)
hold off
xlabel('$t$ (s)','interpreter','latex','fontsize',14)
ylabel('$y (t)$','interpreter','latex','fontsize',14)
legend({'Simulink 1','Simulink 2','Simulink 3'}, 'interpreter','latex','fontsize',11)
grid on

%% ODE function
function xd = odefun(t, x)
    A = -1;
    B =  1;
    u = 5.*(t>=1); %Step function
    xd = A*x + B*u;
end