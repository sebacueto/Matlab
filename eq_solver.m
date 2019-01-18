clear all; clc;

syms Ti T WMAX C t

t = Ti + 2*T;

eqns = [(WMAX/T)*(t^2 - 2*Ti*t - 3*T*t + (1/(2*T))*(4*t*T^2 - t*Ti^2 - ((t^3)/3) + Ti*t^2)) + (2*WMAX*T^3 + 6*WMAX*T^2*Ti + 6*WMAX*T*Ti^2 + WMAX*Ti^3)/(6*T^2) == WMAX*t + C];

S = solve(eqns,C);
