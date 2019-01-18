
function DERVAR = toyprob(t,XVAR)

g = 9.806;
Ma = 1.9414;
ega = 7.5266e-4;
k1 = 9.2159e4;

[angle,anglep,anglepp] = vinput(t);

Fd = Ma*ega*(anglepp*cos(angle) - (anglep^2)*sin(angle));

Y = XVAR(1);
Yp = XVAR(2);

DERVAR(1) = Yp;

Ypp = (-k1*Y + Ma*g + Fd);

DERVAR(2) = Ypp;

DERVAR = DERVAR';


