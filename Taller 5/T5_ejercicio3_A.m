g=inline('1/(1+25*x^2)');
n=10;
es=2/2000;
x=[-1:es:1];
y=zeros(length(x),1);
for i=1:length(x)
    y(i)=g(x(i));
end
xnodos=zeros(n,1);
ynodos=zeros(n,1);
for i=1:n
    xnodos(i)=-1+(2*i)/n;
    ynodos(i)=g(xnodos(i));
end
wnodos=zeros(n,1);
ywnodos=zeros(n,1);
for i=1:n
    wnodos(i)=cos(((2*(n-i)+1)*pi)/(2*(n+1)));
    ywnodos(i)=g(wnodos(i));
end
pol1=lagrange_2(xnodos,ynodos,x);
pol2=lagrange_2(wnodos,ywnodos,x);
sp = spline(xnodos,ynodos,x);
hold on
plot(x,y)
plot(x,pol1)
plot(x,pol2)
plot(x,sp)
axis([-1 1 -1.3 1])
title('Grafica de la función los polinomios de interpolación y el spline cubico')
xlabel('x=[-1:0.001:1]')
ylabel('g(x) & Pn(x) & Sp(x)')
legend ('g(x)','Pn(xi)','Pn(wi)','Sp(x)')
hold off

