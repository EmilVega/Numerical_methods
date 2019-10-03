function [valor] = lagrange(x,y,z)
% Esta funci�n eval�a el polinomio de interpolaci�n de Lagrange
% en el punto x= z
% Autor: Z. Castillo
% Fecha: 30/05/2016
n = length(x);
if length(y)~= n
    disp('Tama�o de  x e y deben ser el mismo');
    return
end
valor = 0;
for i = 1:n
    l = y(i);
    for j=1:n
        if i~= j 
            l = l*(z-x(j))/(x(i)-x(j));
        end
    end
    valor = valor+l;
end

    