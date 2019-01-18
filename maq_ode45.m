clear all; clc;


% Valores de entrada
m_1= 0.0305071;    % m_1 y m_2 corresponden a la masa colocada en el disco
m_2= 0.0309199;    % m_1 < m_2 [kg]
w0= 0;             % Velocidad de rotación del disco [rad/s] 60.5
E_p= 2e11 ;        % Modulo de Young del material de la probeta [Pa]
I_p= 1.707e-10;    % Momento de inercia de la probeta [m4]. Cuadrado de 1/2''
tf= 0.01;             % Tiempo final [s]

%Parámetros del sistema
R_d= 0.1120 ;        % Radio disco de aluminio [m]
M_d= 1.88;           % Masa disco y conjunto [kg] 5.8504 kg (deformación medida)
E_ac= 2e11;          % Modulo de Yound acero [Pa]
I_b1= 5.6718e-8;      % Momento de inercia brazo 1 [m4]
L_b1= 33.3e-2;       % Largo brazo 1 [m]
l_pq= 0.2005;        % Largo brazo 2 entre P y Q [m]
l_pgb= 0.042433;     % Largo brazo 2 entre P y centro de masa Gb [m]
l_gbq= 0.158067;     % Largo brazo 2 entre centro de masa gb y Q [m]
M_b= 2.305;          % Masa brazo 2 [kg]
I_gb= 6.8311e-4;     % Momento de inercia brazo 2 [kg*m2]
L_p= 0.0724;         % Largo de probeta [m]
g=9.806 ;            % Gravedad [m/s2]

M_a = m_1+m_2+M_d;
k_1 =(3*E_ac*(I_b1))/(L_b1^3);
%k_1 =(3*E_ac*(1.302e-8))/(L_b1^3); %corregir I_b1
k_2 = (3*E_p*I_p)/((L_p)^3);
e_ga = (R_d*(m_2-m_1))/(m_1+m_2);

tspan = [0 tf];

%Condiciones iniciales

x0=zeros(1,4);

x0 (1)= 0;         % y_q
x0 (2)= 0;         % \gamma
x0 (3)= 0;        % \beta
x0 (4)= 0;         % \psi

%ode45


%[t,tp,tpp] = vinput(time);
t=0;
tp=0;
tpp=0;

%phi=@(time,x) [x(2);(I_gb*x(1)*k_1-I_gb*M_b*g-I_gb*M_a*g+I_gb*x(1)*k_2-x(3)^3*x(4)^2*M_b^2*l_gbq^3+M_b*x(1)*k_2*l_gbq^2+x(3)*x(4)^2*M_b^2*l_gbq^3+x(3)*I_gb*k_1*l_pq+x(3)^2*M_b^2*g*l_gbq^2+I_gb*M_a*e_ga*tp^2*sin(time)+M_a*M_b*g*l_gbq*l_pgb-M_a*M_b*g*l_pq*l_pgb+x(3)*x(4)^2*I_gb*M_b*l_gbq+x(3)*x(4)^2*I_gb*M_a*l_pq+M_a*x(1)*k_2*l_gbq*l_pq-M_b*x(1)*k_1*l_gbq*l_pgb+M_a*x(1)*k_2*l_pq*l_pgb-I_gb*M_a*e_ga*tpp*cos(time)+x(3)^2*M_a*M_b*g*l_gbq^2-x(3)^2*M_b*x(1)*k_1*l_gbq^2-x(3)^2*M_b*x(1)*k_2*l_gbq^2-x(3)^3*M_b*k_1*l_gbq^2*l_pq+x(3)*x(4)^2*M_a*M_b*l_gbq^2*l_pq-x(3)^3*x(4)^2*M_a*M_b*l_gbq^2*l_pq-x(3)*M_b*k_1*l_gbq*l_pq*l_pgb+x(3)^2*M_a*M_b*e_ga*l_gbq^2*tpp*cos(time)+M_a*M_b*e_ga*l_gbq*l_pgb*tpp*cos(time)-x(3)^2*M_a*M_b*e_ga*l_gbq^2*tp^2*sin(time)-M_a*M_b*e_ga*l_gbq*l_pgb*tp^2*sin(time))/(I_gb*M_a+I_gb*M_b-x(3)^2*M_b^2*l_gbq^2-x(3)^2*M_a*M_b*l_gbq^2-M_a*M_b*l_gbq*l_pgb+M_a*M_b*l_pq*l_pgb);
%    x(4);-(x(3)*x(4)^2*M_b^2*l_gbq^2+M_a*x(1)*k_2*l_gbq+M_b*x(1)*k_2*l_gbq+M_a*x(1)*k_2*l_pgb-M_b*x(1)*k_1*l_pgb-x(3)*M_b*k_1*l_pq*l_pgb+x(3)*x(4)^2*M_a*M_b*l_gbq^2+M_a*M_b*e_ga*l_pgb*tpp*cos(time)-M_a*M_b*e_ga*l_pgb*tp^2*sin(time)+x(3)*x(4)^2*M_a*M_b*l_gbq*l_pgb-x(3)*x(4)^2*M_a*M_b*l_pq*l_pgb)/(I_gb*M_a+I_gb*M_b-x(3)^2*M_b^2*l_gbq^2-x(3)^2*M_a*M_b*l_gbq^2-M_a*M_b*l_gbq*l_pgb+M_a*M_b*l_pq*l_pgb)];

opts = odeset('RelTol',1e-8,'AbsTol',1e-8);
               
[tp,x]=ode23s(@machinefun,[0,1.5],[0;0;0;0],opts);
 

%[tp,x]=ode45(@machinefun,[0,0.1],[0;0;0;0]);

figure(1);
plot(tp,x(:,1),'-o');
xlabel('time')
ylabel('YQ')

figure(2);
plot(tp,x(:,2),'-o');
xlabel('time')
ylabel('YQ_p')

figure(3)
plot(tp,x(:,3),'-o')
xlabel('time')
ylabel('\beta')

figure(4)
plot(tp,x(:,4),'-o')
xlabel('time')
ylabel('\beta_p')
