
function der = testf(T,x)

   for i=1:length(T)
     
       der(i) = pi*exp(-T(i));

   end

end