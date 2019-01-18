clear all; clc

opts = odeset('RelTol',1e-8,'AbsTol',1e-8);

[tp,x]=ode23s(@prob_3dof,[0,2],[0,0,0,0,0,0],opts);

figure(1);
plot(tp,x(:,1));
grid on
xlabel('time')
ylabel('Y1') 

figure(2);
plot(tp,x(:,3)); 
grid on
xlabel('time')
ylabel('Y2') 

figure(3);
plot(tp,x(:,5));
grid on
xlabel('time')
ylabel('\beta')

%figure(4);
%plot(tp,x(:,4));
%grid on
%xlabel('time')
%ylabel('Y_p')
