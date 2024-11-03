%% LSIM Example

close all
clear all
clc

%% Problem Setup
A = -1;
B = 1;
C = 1;
D = 0;

x0 = 2;
t = 0:0.01:10;
U = 5.*(t>=1); %Step function
ssSym = ss(A, B, C, D);

%% Numerical solution
[yy,~,xx] = lsim(ssSym,U,t,x0);

%% Plotting solution
figure(1)
plot(t, yy, 'linewidth', 2)
xlabel('$t$ (s)','interpreter','latex','fontsize',14)
ylabel('$y (t)$','interpreter','latex','fontsize',14)
grid on
