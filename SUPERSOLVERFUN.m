
MassT;
F = zeros(length(M),1);
dm = zeros(length(M),1);
Me = zeros(length(M),1);
Fmax = zeros(length(M),1);

for i = 1:1:length(M)
    i
%     m1 = (i/1000);
%     m2 = 0;
    m1 = M(i,1);
    m2 = M(i,2);
    
    
    opts = odeset('RelTol',1e-8,'AbsTol',1e-8);
    [tp,x]=ode45(@(t,XVAR)machfun_test(t,XVAR,m1,m2), [0,10],[0;0;0;0],opts);
    
    laux = length(tp);
    
    
    l2 = 0.1581;
    k2 = 2.6988e+05;

    dy = x(:,1) + l2*x(:,3);
    Fp = dy*k2;
    Faux = Fp(round(laux/2):laux,:); 
    Fabs = abs(max(Faux) - min(Faux)); 
    fmax = abs(max(Faux));
    fmin = abs(min(Faux));
        if fmax > fmin
            Fmax(i) = fmax;
        else
            Fmax(i) = fmin;
        end
    F(i) = Fabs;
    dm(i) = m1-m2;
    
    Rd = 0.1120 ;  
    Md = 19.2029;   
    ega = (Rd*(m1-m2))/(m1+m2);
    Ma = Md + m1 + m2;
    Me(i) = ega*Ma;
    save('resultados_tabla_1','F','dm','Me','Fmax');
    
end
