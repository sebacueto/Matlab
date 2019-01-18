
function DERVAR = prob_3dof(t,XVAR)

Ma = 1.9414;
Mb = 2.3050;
l1 = 0.0424;
l2 = 0.1581;
k1 = 9.2159e+04;
k2 = 2.6988e+04;
k3 = 1.2e8;
Igb = 6.8311e-04;
g = 0;
ega = 7.5266e-04;

[angle,anglep,anglepp] = vinput(t);


Y = XVAR (1);

Yp = XVAR(2);

X = XVAR(3);

Xp = XVAR(4);

B = XVAR(5);

Bp = XVAR(6);

DERVAR(1) = XVAR(2);

Ypp = (-k2*(Y + l2*B) - k3*(Y - l1*B - X) + Mb*g)/Mb;

DERVAR(2) = Ypp;

DERVAR(3) = XVAR(4);

Xpp = (Ma*g + Ma*ega*((anglep^2)*sin(angle) - anglepp*cos(angle)) - k1*X - k3*(Y - l1*B - X))/Ma;

DERVAR(4) = Xpp;

DERVAR(5) = XVAR(6);

Bpp = (-k2*(Y + l2*B) - k3*(Y -l1*B - X))/Igb;

DERVAR(6) = Bpp;

DERVAR  = DERVAR';