%% ODE45 Example

close all
clear all
clc

%% Problem Setup
x0 = 2;
t = 0:0.01:10;

%% Numerical solution
[~,xx] = ode45(@(t,x)odefun(t,x), t, x0);
C = 1;
D = 0;
yy = C*xx + D*(5.*(t>=1));

%% Plotting result
figure(1)
plot(t, yy, 'linewidth', 2)
xlabel('$t$ (s)','interpreter','latex','fontsize',14)
ylabel('$y (t)$','interpreter','latex','fontsize',14)
grid on

%% ODE function
function xd = odefun(t, x)
    A = -1;
    B =  1;
    u = 5.*(t>=1); %Step function
    xd = A*x + B*u;
end