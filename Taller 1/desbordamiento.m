%Este script se usa para entender la
% m�xima capacidad de representaci�n de 
% la m�quina.
% Se observa que a partir del n�mero ~ 8.988465674311581e(307)
% el c�lculo de x va a "inf" lo que significa que ya la m�quina 
% no es capaz de representar los siguientes n�meros (overflow)
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