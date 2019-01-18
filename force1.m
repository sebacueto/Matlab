clear all; clc;

load resultados_tabla_25.mat

figure(1)
plot(dm, Fmax,'.')
grid on
xlabel('m_1 - m_2  [kg]')
ylabel('Fuerza máxima [N]')

figure(2)
plot(dm,F/2,'.')
grid on
grid on
xlabel('m_1 - m_2  [kg]')
ylabel('Amplitud fuerza [N]')

Fm = Fmax - F/2;

figure(3)
plot(dm, Fm, '.')
xlabel('m_1 - m_2  [kg]')
ylabel('Fuerza media [N]')