    
clear all; clc

opts = odeset('RelTol',1e-8,'AbsTol',1e-8);

[tp,x]=ode45(@machfun, [0,10],[0;0;0;0],opts);

l2 = 0.1581;
k2 = 2.6988e+05;
F2 = (x(:,1)+l2*x(:,3))*k2;

%[tp,x]=ode45(@ytest ,[0;5], [0;0;0;0]);

%[tp,x]=ode45(@toyprob ,[0,10],[0;0],opts); %Para toyprob
 
%[tp,x]=ode45(@machinefun,[0,0.1],[0;0;0;0]);

figure(1);
plot(tp,x(:,1));
grid on
xlabel('time')
ylabel('Y') 

figure(2);
plot(tp,x(:,3)); 
grid on
xlabel('time')
ylabel('\theta') 

figure(3);
plot(tp,x(:,2));
grid on
xlabel('time')
ylabel('Y_p') 

figure(4);
plot(tp,x(:,4));
grid on
xlabel('time')
ylabel('\theta_p') 

figure(5);
plot(tp,F2)
grid on
xlabel('time')
ylabel('F_2')