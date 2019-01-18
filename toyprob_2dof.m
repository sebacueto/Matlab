
function DERVAR = toyprob_2dof(t,XVAR)

Ma = 1.9414;
Mb = 2.3050;
l1 = 0.0424;
l2 = 0.1581;
k1 = 9.2159e+04;
k2 = 2.6988e+04;
Igb = 6.8311e-04;
g = 9.806;
ega = 7.5266e-04;


[angle,anglep,anglepp] = vinput(t);

X = XVAR (1);

Xp = XVAR(2);

Y = XVAR(3);

Yp = XVAR(4);

DERVAR(1) = XVAR(2);

Xpp = (-k2/(Mb*l1))*(X*(l1 + l2) + l2*Y) + (k1*Y/Mb) + (Ma*ega*(-(anglep^2)*sin(angle) + anglepp*cos(angle))/Mb) + (Ma*g/Mb) + g;

DERVAR(2) = Xpp;

DERVAR(3) = XVAR(4);

Ypp = (-k1*Y/Ma) + ega*((anglep^2)*sin(angle) - anglepp*cos(angle)) + g;

DERVAR(4) = Ypp;

DERVAR  = DERVAR';