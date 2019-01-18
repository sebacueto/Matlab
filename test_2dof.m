clear all; clc

opts = odeset('RelTol',1e-8,'AbsTol',1e-8);

[tp,x]=ode23s(@toyprob_2dof,[0,5],[0,0,0,0],opts);

figure(1);
plot(tp,x(:,1));
grid on
xlabel('time')
ylabel('X') 

figure(2);
plot(tp,x(:,3)); 
grid on
xlabel('time')
ylabel('Y') 

figure(3);
plot(tp,x(:,2));
grid on
xlabel('time')
ylabel('X_p')

figure(4);
plot(tp,x(:,4));
grid on
xlabel('time')
ylabel('Y_p')
