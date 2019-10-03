function [x1,x2] = calcula_raiz2(a,b,c)
% Esta función calcula las raices del polinomio
% P(x) = ax^2 + bx + c usando un método no-clásico
% En particular se desea verificar la pérdida de 
% precisión cuando a=c=1 y b=-10^5
% Una solución con 11 dígitos correctos es:
% x1 = 99999.999990; x2 = 0.000010000000001
    x1 = -(b + sign(b)*sqrt(b^2 -4*a*c))/2*a;
    x2 = c/(a*x1);
end