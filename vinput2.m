
function [t,tp,tpp] = vinput2(time)

Ti = 2;
WMAX = 20;
T = 2.5;

for i=1:length(time)
    
    if(time(i) < Ti)   
    t(i) = 0;
    tp(i)=0;
    tpp(i)=0;
    
    elseif (time(i) < (Ti + T)) 
    t(i) = (WMAX/(6*T^2))*((time(i)^3) - 3*Ti*(time(i)^2) + 3*time(i)*(Ti^2) - Ti^3);
    tp(i) = (WMAX/(2*T^2))*((time(i)^2) - 2*Ti*time(i) + Ti^2);
    tpp(i) = (WMAX/(T^2))*(time(i) - Ti);
    
    elseif (time(i) < (Ti + 2*T))
    t(i) = (WMAX/T)*(time(i)^2 - 2*Ti*time(i) - 3*T*time(i) + (1/(2*T))*(4*time(i)*T^2 - time(i)*Ti^2 - ((time(i)^3)/3) + Ti*time(i)^2)) + ((2*WMAX*T^3 + 6*WMAX*Ti*T^2 + 6*WMAX*T*Ti^2 + WMAX*Ti^3)/(6*T^2));  
    %t(i) = (WMAX/(6*T^2))*(6*T*time(i)^2 - time(i)*(12*T*Ti + 18*T^2) + 12*time(i)*T^2 - 3*time(i)*Ti^2 - time(i)^3 + 3*Ti*time(i)^2 + 2*T^3 + 6*T^2*Ti + 6*T*Ti^2 + Ti^3);
    tp(i) = (WMAX/T)*(2*time(i) - 2*Ti - 3*T + (1/(2*T))*(4*T^2 - Ti^2 - (time(i)^2) + 2*Ti*time(i)));
    tpp(i) = (WMAX/T)*(2 - ((time(i) - Ti)/T));
    
    else
    t(i) = WMAX*time(i) - WMAX*(T + Ti);
    tp(i) = WMAX;
    tpp(i) = 0;
    
    end
end