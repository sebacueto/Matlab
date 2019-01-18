
clear all; clc;

opts = odeset('RelTol',1e-8,'AbsTol',1e-8);


[tp,x]=ode45(@machfun, [0,10],[0;0;0;0],opts);

laux = length(tp);

l2 = 0.1581;
k2 = 2.6988e+05;

dy = x(:,1) + l2*x(:,3);
F = dy*k2;
Faux = F(round(laux/2):laux,:);
Fabs = abs(max(Faux) - min(Faux))
Fmax = max(Faux)
Fmin = min(Faux)


figure(1);
plot(tp,x(:,1));
grid on
xlabel('time  [s]')
ylabel('Y  [m]') 

figure(2);
plot(tp,x(:,3)); 
grid on
xlabel('time  [s]')
ylabel('\theta  [rad]') 

figure(3);
plot(tp,x(:,2));
grid on
xlabel('time  [s]')
ylabel('Y_p  [m/s]') 

figure(4);
plot(tp,x(:,4));
grid on
xlabel('time  [s]')
ylabel('\theta_p  [rad/s]') 

figure(5);
plot(tp,F)
grid on
xlabel('time  [s]')
ylabel('F_{probeta}  [N]')