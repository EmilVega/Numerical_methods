%Este script se usa para entender la
% máxima capacidad de representación de 
% la máquina.
% Se observa que a partir del número ~ 8.988465674311581e(307)
% el cálculo de x va a "inf" lo que significa que ya la máquina 
% no es capaz de representar los siguientes números (overflow)
x = 1; i = 0; parada = 0
 while parada == 0 
     x0=x;
     i = i+1;
     x = 2*x;

     if isinf(x) 
         parada = 1;
     end
     x
 end