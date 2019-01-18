
function DERVAR = machfun3(t, XVAR)

% Valores de entrada
m1= 0;               % m_1 y m_2 corresponden a la masa colocada en el disco
m2= 0.0309199;       % m_1 < m_2 [kg]
E_p= 2e11;           % Modulo de Young del material de la probeta [Pa]
I_p= 1.707e-10;      % Segundo momento de área de la probeta [m4]. Cuadrado de 1/2''

% Parámetros del sistema
R_d = 0.1120 ;       % Radio disco de aluminio [m]
Md = 1.88;           % Masa disco y conjunto [kg] 5.8504 kg (deformación medida)
E_ac = 2e11;         % Modulo de Yound acero [Pa]
I_b1 = 5.6718e-8;    % Segundo momento de área brazo 1 [m4]
L_b1 = 33.3e-2;      % Largo brazo 1 [m]
l = 0.2005;          % Largo brazo 2 entre P y Q [m]
l1 = 0.042433;       % Largo brazo 2 entre P y centro de masa Gb [m]
l2 = 0.158067;       % Largo brazo 2 entre centro de masa Gb y Q [m]
Mb = 2.3050;         % Masa brazo 2 [kg]
Igb = 6.8311e-4;     % Momento de inercia brazo 2 [kg*m2]
L_p = 0.0724;        % Largo de probeta [m]
g = 9.806;           % Gravedad

% Cálculos
Ma = m1 + m2 + Md;
k1 = 0.1*(3*E_ac*(I_b1))/(L_b1^3);
k2 = 0.1*(3*E_p*I_p)/((L_p)^3);
ega = (R_d*(m2-m1))/(m1+m2);

% Función de aceleración del disco
[angle,anglep,anglepp] = vinput(t);

Y = XVAR(1);
Yp = XVAR(2);
B = XVAR(3);
Bp = XVAR(4);

DERVAR(1) = Yp;
Ypp = (Ma*ega*(anglep*anglep*sin(angle) - anglepp*cos(angle))*(Igb + 2*Ma*l1*l1) - k1*(Y - l1*B)*Igb - k2*(Y + l2*B)*(Igb + Ma*l1*l1 + Ma*l1*l2))/((Ma + Mb)*(Igb + Ma*l1*l1) - Ma*Ma*l1*l1);
%Ypp = (Ma*l1*(Igb + Ma*l1*l1)*(Ma*ega*(anglep*anglep*sin(angle) - anglepp*cos(angle))*(1 + l1) - k2*(Y + l2*B)*(1 + l2) - k1*(Y - l1*B)*(1 - l1) - g*((Ma + Mb) - Ma*l1)))/((Ma + Mb)*(Igb + Ma*l1*l1) - Ma*Ma*l1*l1);

DERVAR(2) = Ypp;

DERVAR(3) = Bp;

Bpp = (Ma*ega*(anglep*anglep*sin(angle) - anglepp*cos(angle))*(Ma*l1 + l1*(Ma + Mb)) - k1*(Y - l1*B)*(Ma*l1 - l1*(Ma + Mb)) - k2*(Y + l2*B)*(Ma*l1 + l2*(Ma + Mb)))/((Ma + Mb)*(Igb + Ma*l1*l1) - Ma*Ma*l1*l1);
%Bpp = ((Ma + Mb)*Ma*l1*(Ma*ega*(anglep*anglep*sin(angle) - anglepp*cos(angle))*(1 + l1) - k2*(Y + l2*B)*(1 + l2) - k1*(Y - l1*B)*(1 - l1) - g*((Ma + Mb) - Ma*l1)))/((Ma + Mb)*(Igb + Ma*l1*l1) - Ma*Ma*l1*l1);

DERVAR(4) = Bpp;

DERVAR = DERVAR';