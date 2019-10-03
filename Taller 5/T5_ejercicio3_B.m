g=inline('1/(1+25*x^2)');
n10=10;
es=2/2000;
x=[-1:es:1];
y=zeros(length(x),1);
for i=1:length(x)
    y(i)=g(x(i));
end
x10=zeros(n10,1);
yn10=zeros(n10,1);
for i=1:n10
    x10(i)=-1+(2*i)/n10;
    yn10(i)=g(x10(i));
end
y10=lagrange_2(x10,yn10,x);
e10 = norm((y-y10),'inf');
subplot(2,2,1)
hold on
plot(x,y10,'r')
plot(x,y,'b')
axis([-1 1 -1.3 1])
title('Error en la norma infinito para n=10')
xlabel('x=[-1:0.001:1];')
ylabel('g(x) & Pn(x)')
legend('Pn10(x)','g(x)')
hold off
fprintf('El error en la norma infinito para n=10 es: %f \n',e10)

%=======================================================================

n20=20;
x20=zeros(n20,1);
yn20=zeros(n20,1);
for i=1:n20
    x20(i)=-1+(2*i)/n20;
    yn20(i)=g(x20(i));
end
y20=lagrange_2(x20,yn20,x);
e20 = norm((y-y20),'inf');
subplot(2,2,2)
hold on
plot(x,y20,'r')
plot(x,y,'b')
axis([-1 1 -0.3 1])
title('Error en la norma infinito para n=20')
xlabel('x=[-1:0.001:1];')
ylabel('g(x) & Pn(x)')
legend('Pn20(x)','g(x)')
hold off
fprintf('El error en la norma infinito para n=20 es: %f \n',e20)

%=======================================================================

n40=40;
x40=zeros(n40,1);
yn40=zeros(n40,1);
for i=1:n40
    x40(i)=-1+(2*i)/n40;
    yn40(i)=g(x40(i));
end
y40=lagrange_2(x40,yn40,x);
e40 = norm((y-y40),'inf');
subplot(2,2,3)
hold on
plot(x,y40,'r')
plot(x,y,'b')
axis([-1 1 -0.3 1])
title('Error en la norma infinito para n=40')
xlabel('x=[-1:0.001:1];')
ylabel('g(x) & Pn(x)')
legend('Pn40(x)','g(x)')
hold off
fprintf('El error en la norma infinito para n=40 es: %f \n',e40)

%=======================================================================

n80=80;
x80=zeros(n80,1);
yn80=zeros(n80,1);
for i=1:n80
    x80(i)=-1+(2*i)/n80;
    yn80(i)=g(x80(i));
end
y80=lagrange_2(x80,yn80,x);
e80 = norm((y-y80),'inf');
subplot(2,2,4)
hold on
plot(x,y80,'r')
plot(x,y,'b')
axis([-1 1 -0 1])
title('Error en la norma infinito para n=80')
xlabel('x=[-1:0.001:1];')
ylabel('g(x) & Pn(x)')
legend('Pn80(x)','g(x)')
hold off
fprintf('El error en la norma infinito para n=80 es: %f \n',e80)
