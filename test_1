clear all; clc;

a=0.1;
b=0.2;
x0=zeros(1,2);
x0 (1)=100;
x0 (2)=0;
tspan=[0 20];

fg=@(t,x) [-a*x(1);a*x(1)-b*x(2)];
[t,x]=ode45(fg,tspan,x0);

plot(t,x)
xlabel('t')
ylabel('x,y')
