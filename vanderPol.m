y0=zeros(1,2);
y0(1)=0;
y0(2)=1;
tspan=[0 3000];

vdp=@(t,y) [y(2);1000*(1-y(1)*y(1))*y(2)-y(1)];

[t,y]=ode45(vdp,tspan,y0);
plot(t,y(:,1),'-o');

