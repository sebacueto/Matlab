
clear all; clc;

opts = odeset('RelTol',1e-5,'AbsTol',1e-8);

[T,X] = ode45(@testf,[0,1],0,opts); plot(T,X,'-ob');