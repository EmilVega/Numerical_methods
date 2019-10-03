%Para hallar los 2001 puntos equidistantes de x que pertenece a [1,-1]
es=2/2000;
x=[-1:es:1];
n=length(x);
f=inline('sinh(x)');
n2=15; % Grado del polinomio
y=zeros(n,1);
xnodos=zeros(n2,1);
ynodos=zeros(n2,1);
for i=1:n
    y(i)=f(x(i));
    
end
for i=1:n2
    xnodos(i)=-1+(2*i)/n2;
    ynodos(i)=f(xnodos(i));
end
pol = lagrange_2(xnodos,ynodos,x);

subplot(2,1,1)
hold on
plot(x,y,'rp')
plot(x,pol,'b')
title('Grafica de la función y el polinomio de interpolación en [−1, 1]')
xlabel('x=[-1:0.001:1]')
ylabel('f(x) & Pn(x)')
legend('f(x)','Pn(x)')
hold off
err = zeros(n,1);
for i=1:n
    err(i)=abs(y(i)-pol(i));
end
subplot(2,1,2)
plot(x,log(err))
title('Grafica del error absoluto')
xlabel('x=[-1:0.001:1]')
ylabel('log(abs(f(x)-Pn(x)))')