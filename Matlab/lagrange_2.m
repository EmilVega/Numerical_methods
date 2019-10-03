function [valor] = lagrange_2(x,y,z)
n = length(x);
if length(y)~= n
    disp('Tama�o de  x e y deben ser el mismo');
    return
end
nz=length(z);
valor = zeros(nz,1);
for k=1:nz
for i = 1:n
    l = y(i);
    for j=1:n
        if i~= j 
            l = l*(z(k)-x(j))/(x(i)-x(j));            
        end
    end
    valor(k) = valor(k)+l;
end
end