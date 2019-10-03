function T3_ejercicio2 (p) 

A=[1 0 0;1 1 1;1 2 4;1 3 9]
b=[4;5;8;p]
AtA=A'*A
Atb=A'*b
c= AtA\Atb
x1 = [0 1 2 3];
Px=zeros(4);
fprintf('\n El polinomio p2(x) de grado 2 es  %d + %d*x %d*x^2\n',c(1),c(2),c(3))

for i=1:4
    Px(i)= c(1)+c(2)*x1(i)+c(3)*(x1(i)^2);
end
hold on
plot (x1,Px,'r')
plot (x1,b,'bp')
axis([-0.5 3.5 0 14]);
hold off 

et=0;
for i=1:4
   et = et + (Px(i)-b(i))^2;
end
fprintf('\n La suma de los errores al cuadrado es %d\n',et)


