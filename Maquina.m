clear all ; clc ;

% Valores de entrada
m_1= 0.0305071;    % m_1 y m_2 corresponden a la masa colocada en el disco
m_2= 0.0309199;    % m_1 < m_2 [kg]
w0= 0;          % Velocidad de rotación del disco [rad/s] 60.5
E_p= 2e11 ;        % Modulo de Young del material de la probeta [Pa]
I_p= 1.707e-10;    % Momento de inercia de la probeta [m4]. Cuadrado de 1/2''
tf= 1;             % Tiempo final [s]

%Parámetros del sistema
R_d= 0.1120 ;        % Radio disco de aluminio [m]
M_d= 1.88;           % Masa disco y conjunto [kg] 5.8504 kg (deformación medida)
E_ac= 2e11;          % Modulo de Yound acero [Pa]
I_b1= 3.98e-10;      % Momento de inercia brazo 1 [m4]
L_b1= 33.3e-2;       % Largo brazo 1 [m]
l_pq= 0.2005;        % Largo brazo 2 entre P y Q [m]
l_pgb= 0.042433;     % Largo brazo 2 entre P y centro de masa Gb [m]
l_gbq= 0.158067;     % Largo brazo 2 entre centro de masa gb y Q [m]
M_b= 2.305;         % Masa brazo 2 [kg]
I_b2= 6.8311e-4;     % Momento de inercia brazo 2 [kg*m2]
L_p= 0.0724;         % Largo de probeta [m]

g=9.806 ;            % Gravedad [m/s2]

% Llamar scrip parámetros

tspan=[0 tf];

M_a = m_1+m_2+M_d;
%k_1= (12*E_ac*I_b1)/((L_b1)^3);

k_1=(3*E_ac*(1.302e-8))/(L_b1^3); %corregir I_b1
k_2= (3*E_p*I_p)/((L_p)^3);
e_ga=(R_d*(m_2-m_1))/(m_1+m_2);


% Constantes
A = k_1 + k_2;
C = -k_1*l_pq;
D = pi*M_a*l_pq-pi*M_b*l_gbq;
E = -M_a-M_b;
F = M_a*l_pq*+M_b*l_gbq;
G = -M_a*l_pq-M_b*l_gbq;
%H = M_a*g+M_b*g-pi*k_1*l_pq-M_a*e_ga*sin(w0*t)*w0*w0;

J = k_2*l_gbq-k_1*l_pgb;
N = k_1*l_pq*l_pgb;
O = pi*M_b*l_gbq*l_gbq-pi*M_a*l_pgb*l_pq;
P = M_a*l_pgb;
Q = -M_a*l_pgb*l_pq-pi*pi*M_b*l_gbq-I_b2;
R = M_a*l_pgb*l_pq-M_b*l_gbq*l_gbq;
S = 2*pi*M_b*l_gbq;
T = -M_b*l_gbq;
%U = pi*k_1*l_pgb*l_pq-l_pgb*M_a*g+l_pgb*M_a*e_ga*sin(w0*t)*w0*w0;

% ode45

x0=zeros(1,4);
x0 (1)= 0;         % y_q
x0 (2)= 0;         % \gamma
x0 (3)= pi;        % \beta
x0 (4)= 0;         % \psi

%dgammadt=@(t,x) ((x(1)*(A*Q-F*J)+x(3)*(C*Q-H*S-F*N)+(x(4)^2)*(D*Q-F*O)+x(3)*(x(4)^2)*(G*Q+S*D-F*R)+(x(3)^2)*(C*S-H*T)+...
                %(x(3)^2)*(x(4)^2)*(G*S+D*T)+x(1)*x(3)*A*S+x(1)*(x(3)^2)*A*T+(x(3)^3)*C*T+(x(3)^3)*(x(4)^2)*G*T+F*U-H*Q)/(P*F...
                %E*Q-E*S*x(3)-E*T*(x(3)^2)));

%dpsidt=@(t,x)
%((x(1)*(A*P-E*J)+x(3)*(C*P-E*N)+(x(4)^2)*(C*D-E*O)+x(3)*(x(4)^2)*(C*G-E*R)-P*H+E*U)/(E*T*(x(3)^2)+E*Sx(3)+E*Q-P*F));


phi=@(t,x) [x(2);((x(1)*(A*Q-F*J)+x(3)*(C*Q-(M_a*g+M_b*g-pi*k_1*l_pq-M_a*e_ga*sin(w0*t)*w0*w0)*S-F*N)+(x(4)^2)*(D*Q-F*O)+...
            x(3)*(x(4)^2)*(G*Q+S*D-F*R)+(x(3)^2)*(C*S-(M_a*g+M_b*g-pi*k_1*l_pq-M_a*e_ga*sin(w0*t)*w0*w0)*T)+...
            (x(3)^2)*(x(4)^2)*(G*S+D*T)+x(1)*x(3)*A*S+x(1)*(x(3)^2)*A*T+(x(3)^3)*C*T+(x(3)^3)*(x(4)^2)*G*T+...
            F*(pi*k_1*l_pgb*l_pq-l_pgb*M_a*g+l_pgb*M_a*e_ga*sin(w0*t)*w0*w0)-...
            (M_a*g+M_b*g-pi*k_1*l_pq-M_a*e_ga*sin(w0*t)*w0*w0)*Q)/(P*F-E*Q-E*S*x(3)-...
            E*T*(x(3)^2)));x(4);((x(1)*(A*P-E*J)+x(3)*(C*P-E*N)+(x(4)^2)*(C*D-E*O)+x(3)*(x(4)^2)*(C*G-E*R)-...
            P*(M_a*g+M_b*g-pi*k_1*l_pq-M_a*e_ga*sin(w0*t)*w0*w0)+E*(pi*k_1*l_pgb*l_pq-l_pgb*M_a*g+...
            l_pgb*M_a*e_ga*sin(w0*t)*w0*w0))/(E*T*(x(3)^2)+E*S*x(3)+E*Q-P*F))];

[t,x]=ode45(phi,tspan,x0);

figure(1);
plot(t,x(:,1),'-o');
xlabel('t')
ylabel('Y_Q')
figure(2)
plot(t,x(:,3),'-o')
xlabel('t')
ylabel('\beta')

