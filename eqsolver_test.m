clear all; clc;

syms k1 k2 Y Yp Ypp B Bp Bpp l1 l2 Ma  Mb ega g Igb anglep angle anglepp Ft

Ft = Ma*(Ypp - l1*Bpp - g - ega*(anglepp*cos(angle) - anglep*anglep*sin(angle))) + k1*(Y - l1*B);

eqns = [Mb*Ypp + k2*(Y + l2*B) - Mb*g == Ft ; Igb*Bpp + k2*l2*(Y + l2*B) == l1*Ft];

S = solve(eqns, Ypp, Bpp);