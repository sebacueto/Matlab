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
M_d= 5.8504;         % Masa disco y conjunto [kg] 1.8 kg calculado
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

% Llamar scrip parámetros

tspan=[0 tf];

M_a = m_1+m_2+M_d;
%k_1= (12*E_ac*I_b1)/((L_b1)^3);

k_1=(3*E_ac*(1.302e-8))/(L_b1^3); %corregir
k_2= (3*E_p*I_p)/((L_p)^3);
e_ga=(R_d*(m_2-m_1))/(m_1+m_2);

%t=0:0.001:1;
%theta=w0*t;
%dthetadt=w0;


% Constantes
A= M_a+M_b;
R= -M_a*l_pq+M_b*l_gbq;
C= -k_1-k_2;
D= -k_1*l_pq;
%E= M_a*e_ga*sin(w0*t)*w0-g*A;
F= l_pgb*M_a;
G= k_2*l_gbq-l_pgb*k_1;
H= -l_pq*l_pgb*k_1;
J= M_b*l_gbq*l_gbq-l_pgb*l_pq*M_a;
N= l_pgb*l_pq*M_a-I_b2;
P= M_b*l_gbq*l_gbq;
%Q= l_pgb*M_a*e_ga*sin(w0*t)*w0*w0-l_pgb*M_a*g;

% ode45

x0=zeros(1,4);
x0 (1)= 0;     % y_q
x0 (2)= 0;         % \gamma
x0 (3)= 0;    % \beta'
x0 (4)= 0;         % \psi

phi=@(t,x) [x(2);((x(4)^2)*x(3)*(N*R+R*J)-x(3)*(N*D+R*H)+(x(3)^2)*(M_a*e_ga*sin(60*t)*60-g*A)...
    *P-(x(3)^2)*x(1)*C*P+x(1)*(R*G-C*N)+P*R*(x(4)^2)*(x(3)^3)+(M_a*e_ga*sin(60*t)*60-g*A)*N-R*...
    (l_pgb*M_a*e_ga*sin(60*t)*3600-l_pgb*M_a*g))*(A*N+A*P*(x(3)^2)-R*F)^(-1);x(4);((x(4)^2)*x(3)*...
    (A*J+F*R)+x(3)*(A*H-D*F)+x(1)*(A*G-C*F)+(M_a*e_ga*sin(60*t)*60-g*A)*F-A*...
    (l_pgb*M_a*e_ga*sin(60*t)*3600-l_pgb*M_a*g))*(R*F-A*N-A*P*(x(3)^2))^(-1)];

[t,x]=ode15s(phi,tspan,x0);

figure(1);
plot(t,x(:,1),'-o');
xlabel('t')
ylabel('Y_Q')
figure(2)
plot(t,x(:,3),'-o')
xlabel('t')
ylabel('\beta')
%figure(3)
%plot(x(:,1),x(:,3),'-o')
%xlabel('Y_Q')
%ylabel('\beta')


%figure(4) plot(t,x(:,2),'-o') xlabel('t') ylabel('\gamma')

%figure(5) plot(t,x(:,4),'-o') xlabel('t') ylabel('\psi')