function DERVAL = prueba(t,x)

% Valores de entrada
m_1= 0.0305071;    % m_1 y m_2 corresponden a la masa colocada en el disco
m_2= 0.0309199;    % m_1 < m_2 [kg]
w0= 0;          % Velocidad de rotación del disco [rad/s] 60.5
E_p= 2e11 ;        % Modulo de Young del material de la probeta [Pa]
I_p= 1.707e-10;    % Momento de inercia de la probeta [m4]. Cuadrado de 1/2''
tf= 1;             % Tiempo final [s]

%Parámetros del sistema
R_d= 0.1120 ;        % Radio disco de aluminio [m]
M_d= 1.88;         % Masa disco y conjunto [kg] 1.8 kg calculado
E_ac= 2e11;          % Modulo de Yound acero [Pa]
I_b1= 3.98e-10;      % Momento de inercia brazo 1 [m4]
L_b1= 33.3e-2;        % Largo brazo 1 [m]
l_pq= 0.2005;        % Largo brazo 2 entre P y Q [m]
l_pgb= 0.042433;     % Largo brazo 2 entre P y centro de masa Gb [m]
l_gbq= 0.158067;     % Largo brazo 2 entre centro de masa gb y Q [m]
M_b= 2.305;          % Masa brazo 2 [kg]
I_b2= 6.8311e-4;     % Momento de inercia brazo 2 [kg*m2]
L_p= 0.0724;         % Largo de probeta [m]

g=9.806 ;            % Gravedad [m/s2]

M_a = m_1+m_2+M_d;
%k_1= (12*E_ac*I_b1)/((L_b1)^3);

k_1=(3*E_ac*(1.302e-8))/(L_b1^3); %corregir
k_2= (3*E_p*I_p)/((L_p)^3);
e_ga=(R_d*(m_2-m_1))/(m_1+m_2);


DERVAL(1) = x(2);

DERVAL(2) = -(I_b2*M_a*g + I_b2*M_b*g - I_b2*k_1*x(1) - I_b2*k_2*x(1) + x(3)^3*M_b^2*l_gbq^3*x(4)^2 + M_b*k_2*l_gbq^2*x(1) - x(3)*I_b2*k_1*l_pq - x(3)^2*M_b^2*g*l_gbq^2 + x(3)*M_b^2*l_gbq^3*x(4)^2 + M_a*M_b*g*l_gbq*l_pgb - M_a*M_b*g*l_pq*l_pgb + x(3)*M_a^2*l_pq^2*l_pgb*x(4)^2 + M_a*k_2*l_gbq*l_pq*x(1) - M_b*k_1*l_gbq*l_pgb*x(1) + M_a*k_2*l_pq*l_pgb*x(1) - x(3)*I_b2*M_b*l_gbq*x(4)^2 - x(3)*I_b2*M_a*l_pq*x(4)^2 - x(3)^2*M_a*M_b*g*l_gbq^2 - I_b2*M_a*e_ga*w0^2*sin(t*w0) + x(3)^3*M_b*k_1*l_gbq^2*l_pq - x(3)*M_a^2*l_pq*l_pgb*x(4)^2 + x(3)^2*M_b*k_1*l_gbq^2*x(1) + x(3)^2*M_b*k_2*l_gbq^2*x(1) + x(3)*M_a*M_b*l_gbq^2*l_pq*x(4)^2 - x(3)*M_b*k_1*l_gbq*l_pq*l_pgb + x(3)^3*M_a*M_b*l_gbq^2*l_pq*x(4)^2 - x(3)*M_a*M_b*l_gbq*l_pgb*x(4)^2 + x(3)*M_a*M_b*l_gbq*l_pq*l_pgb*x(4)^2 + x(3)^2*M_a*M_b*e_ga*l_gbq^2*w0^2*sin(t*w0) - M_a*M_b*e_ga*l_gbq*l_pgb*w0^2*sin(t*w0))/(I_b2*M_a + I_b2*M_b - x(3)^2*M_b^2*l_gbq^2 - x(3)^2*M_a*M_b*l_gbq^2 + M_a*M_b*l_gbq*l_pgb - M_a*M_b*l_pq*l_pgb);

DERVAL(3) = x(4);

DERVAL(4) = (x(3)*M_b^2*l_gbq^2*x(4)^2 - x(3)*M_a^2*l_pgb*x(4)^2 + M_a*k_2*l_gbq*x(1) + M_b*k_2*l_gbq*x(1) + M_a*k_2*l_pgb*x(1) - M_b*k_1*l_pgb*x(1) - x(3)*M_b*k_1*l_pq*l_pgb - x(3)*M_a*M_b*l_pgb*x(4)^2 + x(3)*M_a*M_b*l_gbq^2*x(4)^2 + x(3)*M_a^2*l_pq*l_pgb*x(4)^2 - M_a*M_b*e_ga*l_pgb*w0^2*sin(t*w0) + x(3)*M_a*M_b*l_gbq*l_pgb*x(4)^2)/(I_b2*M_a + I_b2*M_b - x(3)^2*M_b^2*l_gbq^2 - x(3)^2*M_a*M_b*l_gbq^2 + M_a*M_b*l_gbq*l_pgb - M_a*M_b*l_pq*l_pgb);


end