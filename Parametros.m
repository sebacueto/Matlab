% Parámetros del sistema

% Discos de contrapeso [g]

m1= 0.7582;
m2= 2.2969;
m3= 6.8541;
m4= 20.5979;
m5= 30.9199;

m_max= 2*m5 + m4 + m3 + m2 + m1;
m_min= m5 - m1 - m2 - m3 - m4;

% Diámetros de discos
d_m=48.05;
w0_m=60;
d_p=47.65;
w0_p=w0_m*d_m/d_p;

% Segundo momento de área de la probeta con sección cuadrada-circular

%I_x=@(x) [1.15-3*x^6-0.0242*x^5+0.752*x^4-7.91*x^3+35.6*x^2-54.7*x+50.6];

% Modulo de rigidez flexo-cortante

% k_fc=(3*E*I/L^3)/(1+(3*E*h^2/(10*G*L^2)));
% h: Alto de la viga

% Deformación medida viga_disco = 4e-3 [m]

