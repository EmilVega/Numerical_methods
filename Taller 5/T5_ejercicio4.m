h=inline('abs(sinh(x))');
n10=10;
es=2/2000;
x=[-1:es:1];
y=zeros(length(x),1);
for i=1:length(x)
    y(i)=h(x(i));
end

x10=zeros(n10,1);
yn10=zeros(n10,1);
xs10=zeros(n10,1);
yns10=zeros(n10,1);
for i=1:n10
    x10(i)=cos(((2*(n10-i)+1)*pi)/(2*(n10+1)));
    yn10(i)=h(x10(i));
    xs10(i)=-1+(2*i)/n10;
    yns10(i)=h(xs10(i));
end
y10=lagrange_2(x10,yn10,x);
e10 = norm((y-y10),'inf');
sp10=spline(xs10,yns10,x);
es10 = norm((y-sp10'),'inf');
fprintf('El error para n=10 en el polinomio de lagrange es: %f\n', e10)
fprintf('El error para n=10 en el spline cubico es: %d\n',es10)

%=======================================================================

n20=20;
x20=zeros(n20,1);
yn20=zeros(n20,1);
xs20=zeros(n20,1);
yns20=zeros(n20,1);
for i=1:n20
    x20(i)=cos(((2*(n20-i)+1)*pi)/(2*(n20+1)));
    yn20(i)=h(x20(i));
    xs20(i)=-1+(2*i)/n20;
    yns20(i)=h(xs20(i));
end
y20=lagrange_2(x20,yn20,x);
e20 = norm((y-y20),'inf');
sp20=spline(xs20,yns20,x);
es20 = norm((y-sp20'),'inf');
fprintf('El error para n=20 en el polinomio de lagrange es: %f\n', e20)
fprintf('El error para n=20 en el spline cubico es: %d\n',es20)

%=======================================================================

n40=40;
x40=zeros(n40,1);
yn40=zeros(n40,1);
xs40=zeros(n40,1);
yns40=zeros(n40,1);
for i=1:n40
    x40(i)=cos(((2*(n40-i)+1)*pi)/(2*(n40+1)));
    yn40(i)=h(x40(i));
    xs40(i)=-1+(2*i)/n40;
    yns40(i)=h(xs40(i));
end
y40=lagrange_2(x40,yn40,x);
e40 = norm((y-y40),'inf');
sp40=spline(xs40,yns40,x);
es40 = norm((y-sp40'),'inf');
fprintf('El error para n=40 en el polinomio de lagrange es: %f\n', e40)
fprintf('El error para n=40 en el spline cubico es: %d\n',es40)

%=======================================================================

n80=80;
x80=zeros(n80,1);
yn80=zeros(n80,1);
xs80=zeros(n80,1);
yns80=zeros(n80,1);
for i=1:n80
    x80(i)=cos(((2*(n80-i)+1)*pi)/(2*(n80+1)));
    yn80(i)=h(x80(i));
    xs80(i)=-1+(2*i)/n80;
    yns80(i)=h(xs80(i));
end
y80=lagrange_2(x80,yn80,x);
e80 = norm((y-y80),'inf');
sp80=spline(xs80,yns80,x);
es80 = norm((y-sp80'),'inf');
fprintf('El error para n=80 en el polinomio de lagrange es: %f\n', e80)
fprintf('El error para n=80 en el spline cubico es: %d\n',es80)

%GRAFICAS
%Polinomio de Interpolaci�n Wi
figure, subplot(2,2,1)
hold on
plot(x,y,'b')
plot(x,y10,'r')
title('Grafica del polinomio para n=10')
xlabel('x=[-1:0.001:1];')
ylabel('f(x) & Pn(x)')
legend('f(x)','Pn(x)')
hold off
subplot(2,2,2)
hold on
plot(x,y,'b')
plot(x,y20,'r')
title('Grafica del polinomio para n=20')
xlabel('x=[-1:0.001:1];')
ylabel('f(x) & Pn(x)')
legend('f(x)','Pn(x)')
hold off
subplot(2,2,3)
hold on
plot(x,y,'b')
plot(x,y40,'r')
title('Grafica del polinomio para n=40')
xlabel('x=[-1:0.001:1];')
ylabel('f(x) & Pn(x)')
legend('f(x)','Pn(x)')
hold off
subplot(2,2,4)
hold on
plot(x,y,'b')
plot(x,y80,'r')
title('Grafica del polinomio para n=80')
xlabel('x=[-1:0.001:1];')
ylabel('f(x) & Pn(x)')
legend('f(x)','Pn(x)')
hold off

%Spline cubico
figure, subplot(2,2,1)
hold on
plot(x,y,'b')
plot(x,sp10,'r')
title('Grafica del spline cubico para n=10')
xlabel('x=[-1:0.001:1];')
ylabel('f(x) & Sp(x)')
legend('f(x)','Pn(x)')
hold off
subplot(2,2,2)
hold on
plot(x,y,'b')
plot(x,sp20,'r')
title('Grafica del spline cubico para n=20')
xlabel('x=[-1:0.001:1];')
ylabel('f(x) & Sp(x)')
legend('f(x)','Pn(x)')
hold off
subplot(2,2,3)
hold on
plot(x,y,'b')
plot(x,sp40,'r')
title('Grafica del spline cubico para n=40')
xlabel('x=[-1:0.001:1];')
ylabel('f(x) & Sp(x)')
legend('f(x)','Pn(x)')
hold off
subplot(2,2,4)
hold on
plot(x,y,'b')
plot(x,sp80,'r')
title('Grafica del spline cubico para n=80')
xlabel('x=[-1:0.001:1];')
ylabel('f(x) & Sp(x)')
legend('f(x)','Pn(x)')
hold off

%==========================================================

error=[e10;e20;e40;e80];
errorsp = [es10;es20;es40;es80];
nm = [10;20;40;80];
figure, subplot(2,1,1)
plot(nm,error)
title('El error en el polinomio de interpolación {wi,g(wi)}')
xlabel('Grados del polinomio')
ylabel('Error norma infinito')
subplot(2,1,2)
plot(nm,errorsp)
title('El error en el spline cubico {xi,g(xi)}')
xlabel('Grados del polinomio')
ylabel('Error norma infinito')