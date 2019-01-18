clear all; clc;

load 'F-Fmax 1 - 25.mat';

figure(1);
plot(Me,Fmax1,'.')
hold on
plot(Me,Fmax2_5,'.')
plot(Me,Fmax5,'.')
plot(Me,Fmax10,'.')
plot(Me,Fmax12_5,'.')
plot(Me,Fmax15,'.')
plot(Me,Fmax20,'.')
plot(Me,Fmax25,'.')
hold off
grid on
xlabel('Masa_{total} X Excentricidad [kg*m]')
ylabel('Fuerza máxima [N]')

% figure(2);
% plot(Me,F1,'.')
% hold on
% plot(Me,F2_5,'.')
% plot(Me,F5,'.')
% plot(Me,F10,'.')
% plot(Me,F12_5,'.')
% plot(Me,F15,'.')
% plot(Me,F20,'.')
% plot(Me,F25,'.')
% hold off
% grid on
% xlabel('Masa_{total} X Desbalanceo [kg*m]')
% ylabel('Fuerza [N]')