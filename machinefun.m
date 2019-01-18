
function DER_VECTOR = machinefun(time,XVAR)


% Valores de entrada
m_1= 0.0305071;    % m_1 y m_2 corresponden a la masa colocada en el disco
m_2= 0.0309199;    % m_1 < m_2 [kg]
w0= 0;             % Velocidad de rotación del disco [rad/s] 60.5
E_p= 2e11 ;        % Modulo de Young del material de la  + CD*Yp)probeta [Pa]
I_p= 1.707e-10;    % Segundo momento de área de la probeta [m4]. Cuadrado de 1/2''
tf= 1;             % Tiempo final [s]

%Parámetros del sistema
R_d= 0.1120 ;        % Radio disco de aluminio [m]
M_d= 1.88;           % Masa disco y conjunto [kg] 5.8504 kg (deformación medida)
E_ac= 2e11;          % Modulo de Yound acero [Pa]
I_b1= 5.6718e-8;     % Segundo momento de área brazo 1 [m4]
L_b1= 33.3e-2;       % Largo brazo 1 [m]
l_pq= 0.2005;        % Largo brazo 2 entre P y Q [m]
l_pgb= 0.042433;     % Largo brazo 2 entre P y centro de masa Gb [m]
l_gbq= 0.158067;     % Largo brazo 2 entre centro de masa gb y Q [m]
M_b= 2.305;          % Masa brazo 2 [kg]
I_gb= 6.8311e-4;     % Momento de inercia brazo 2 [kg*m2]
L_p= 0.0724;         % Largo de probeta [m]
g= 9.806;            % Gravedad [m/s2]

M_a = m_1 + m_2 + M_d;

k_1 = 1.0*(3*E_ac*(1.302e-8))/(L_b1^3);
k_2 = 1.0*(3*E_p*I_p)/((L_p)^3);

e_ga = (R_d*(m2-m1))/(m1+m_2);

[t,tp,tpp] = vinput(time);

B = XVAR(3);

Bp =  XVAR(4);

Y =  XVAR(1);

Yp = XVAR(2);

CD = -200;
     
DER_VECTOR(1) = XVAR(2);

Ypp = (I_gb*Y*k_1 - I_gb*M_b*g - I_gb*M_a*g + I_gb*(Y*k_2 + CD*Yp) - B^3*Bp^2*M_b^2*l_gbq^3 + M_b*(Y*k_2 + CD*Yp)*l_gbq^2 + B*Bp^2*M_b^2*l_gbq^3 + B*I_gb*k_1*l_pq + B^2*M_b^2*g*l_gbq^2 + I_gb*M_a*e_ga*tp^2*sin(t) + M_a*M_b*g*l_gbq*l_pgb - M_a*M_b*g*l_pq*l_pgb + B*Bp^2*I_gb*M_b*l_gbq + B*Bp^2*I_gb*M_a*l_pq + M_a*(Y*k_2 + CD*Yp)*l_gbq*l_pq - M_b*Y*k_1*l_gbq*l_pgb + M_a*(Y*k_2 + CD*Yp)*l_pq*l_pgb - I_gb*M_a*e_ga*tpp*cos(t) + B^2*M_a*M_b*g*l_gbq^2 - B^2*M_b*Y*k_1*l_gbq^2 - B^2*M_b*(Y*k_2 + CD*Yp)*l_gbq^2 - B^3*M_b*k_1*l_gbq^2*l_pq + B*Bp^2*M_a*M_b*l_gbq^2*l_pq - B^3*Bp^2*M_a*M_b*l_gbq^2*l_pq - B*M_b*k_1*l_gbq*l_pq*l_pgb + B^2*M_a*M_b*e_ga*l_gbq^2*tpp*cos(t) + M_a*M_b*e_ga*l_gbq*l_pgb*tpp*cos(t) - B^2*M_a*M_b*e_ga*l_gbq^2*tp^2*sin(t) - M_a*M_b*e_ga*l_gbq*l_pgb*tp^2*sin(t))/(I_gb*M_a + I_gb*M_b - B^2*M_b^2*l_gbq^2 - B^2*M_a*M_b*l_gbq^2 - M_a*M_b*l_gbq*l_pgb + M_a*M_b*l_pq*l_pgb); 

DER_VECTOR(2) = Ypp;

DER_VECTOR(3) = XVAR(4);

Bpp = -(B*Bp^2*M_b^2*l_gbq^2 + M_a*(Y*k_2 + CD*Yp)*l_gbq + M_b*(Y*k_2 + CD*Yp)*l_gbq + M_a*(Y*k_2 + CD*Yp)*l_pgb - M_b*Y*k_1*l_pgb - B*M_b*k_1*l_pq*l_pgb + B*Bp^2*M_a*M_b*l_gbq^2 + M_a*M_b*e_ga*l_pgb*tpp*cos(t) - M_a*M_b*e_ga*l_pgb*tp^2*sin(t) + B*Bp^2*M_a*M_b*l_gbq*l_pgb - B*Bp^2*M_a*M_b*l_pq*l_pgb)/(I_gb*M_a + I_gb*M_b - B^2*M_b^2*l_gbq^2 - B^2*M_a*M_b*l_gbq^2 - M_a*M_b*l_gbq*l_pgb + M_a*M_b*l_pq*l_pgb);

DER_VECTOR(4) = Bpp;

DER_VECTOR = DER_VECTOR';

