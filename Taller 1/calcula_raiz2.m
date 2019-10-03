function [x1,x2] = calcula_raiz2(a,b,c)
% Esta funci�n calcula las raices del polinomio
% P(x) = ax^2 + bx + c usando un m�todo no-cl�sico
% En particular se desea verificar la p�rdida de 
% precisi�n cuando a=c=1 y b=-10^5
% Una soluci�n con 11 d�gitos correctos es:
% x1 = 99999.999990; x2 = 0.000010000000001
    x1 = -(b + sign(b)*sqrt(b^2 -4*a*c))/2*a;
    x2 = c/(a*x1);
end