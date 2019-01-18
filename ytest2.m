function YFUN = ytest2(t,YVAR)

Mb = 2;
Ma = 1;
l1 = 0.0424;
l2 = 0.1581;
k1 = 2e3;
k2 = 2e4;
Igb = 1;
g = 9.806;
ega = 0.1;
F = Ma*g;

%c1 = 50;
%c2 = 50;

[angle,anglep,anglepp] = vinput(t);

x = YVAR(1);
xp = YVAR(2);
th = YVAR(3);
thp = YVAR(4);

% - c2*(xp + l2*thp) - c1*(xp - l1*thp) - Damper xpp
% - c2*l2*(xp + l2*thp) + c1*l1*(xp - thp*l1) - Damper thpp

YFUN(1) = xp;
YFUN(2) = (-k2*(x + l2*th) - k1*(x - l1*th))/Mb  + (Ma*g/Mb) + Ma*ega*(-anglep*anglep*sin(angle) + anglepp*cos(angle)) + g;
YFUN(3) = thp;
YFUN(4) = (-k2*l2*(x + l2*th) + k1*l1*(x - l1*th) + (Ma*g + Ma*ega*(-anglep*anglep*sin(angle) + anglepp*cos(angle))*l1))/Igb;

YFUN = [YFUN(1), YFUN(2), YFUN(3), YFUN(4)]';