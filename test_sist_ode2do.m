clear all; clc;

x0=zeros(1,4);
x0(1)=0;
x0(2)=1;
x0(3)=0;
x0(4)=6.27;

tspan=[0,10];

fg=@(t,x) [x(2);-4*pi*pi*x(1)/(sqrt(x(1)*x(1)+x(3)*x(3)))^3;x(4);-4*pi*pi*x(1)/(sqrt(x(1)*x(1)+x(3)*x(3)))^3];

[t,x]=ode45(fg,tspan,x0);

plot(x(:,1),x(:,3),'r')
xlabel('x')
ylabel('y')
