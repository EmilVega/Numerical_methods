% Nombre del programa: USV_geometria
% Autores: Airina Cordova - Sebastian Cortez - Maria Molina - Emil Vega
% Email de los autores: airina.cordova@yachaytech.edu.ec -
% sebastian.cortez@yachaytech.edu.ec - maria.molina@yachay.tech.edu.ec -
% emil.vega@yachaytech.edu.ec% 
% Fecha de elaboracion: Julio 21 de 2016
% Breve descripción del programa: Permite observar de forma geometrica el
% comportamiento de las matriz A, V, U, S, AV y US.
% Datos de entrada: 
%−−−−−−−−−−−−−−−−
% Datos de s a l i d a :
% - Grafica de A - Grafica de V - Gráfica de U - Grafica de S - Grafica de AV y Gráfica de US 

A = rand(2); [U,S,V] = svd(A); 
%**************************************************************
fprintf('Generando las graficas...\n\n'); 
fprintf('La matriz generada es: \n')
A
figure
%grafica de A
 subplot(2,3,1)
a1=A(:,1);
a2=A(:,2);
plot([0,a1(1)],[0,a1(2)],'b') %Se plotea el 0 debido a que es tomado como el centro
hold on
plot([0,a2(1)],[0,a2(2)],'b')
title('Columnas de A')
axis equal
hold off

%grafica de U
subplot(2,3,4)
u1=U(:,1);
u2=U(:,2);
plot([0,u1(1)],[0,u1(2)],'b')
hold on
plot([0,u2(1)],[0,u2(2)],'b')
t=-pi:0.01:pi;
x=cos(t);
y=sin(t);
%hold on
plot(x,y)
title('Columnas de U')
axis equal
hold off

%grafica de V
subplot(2,3,2)
v1=V(:,1);
v2=V(:,2);
plot([0,v1(1)],[0,v1(2)],'r')
axis equal
hold on
plot([0,v2(1)],[0,v2(2)],'r')
t=-pi:0.01:pi;
x=cos(t);
y=sin(t);
%hold on
plot(x,y)
title('Columnas de V')
hold off

%grafica de S
subplot(2,3,5)
s1=S(:,1);
s2=S(:,2);
plot([0,s1(1)],[0,s1(2)],'r')
hold on
plot([0,s2(1)],[0,s2(2)],'r')
title('Columnas de S')
axis equal
m=size(x,2);
X=zeros(2,m);
for j=1:1:m
    X(1,j)=x(j);
    X(2,j)=y(j);
end
F=S*X;
plot(F(1,:),F(2,:))
axis equal
hold off

%efecto de premultiplicar V por A %
subplot(2,3,3)
B=A*V;
b1=B(:,1);
b2=B(:,2);
plot([0,b1(1)],[0,b1(2)],'m')
hold on
plot([0,b2(1)],[0,b2(2)],'m')
title('Efecto de premultiplicar V por A')
%grafica de la elipse cuyos semiejes son b1 y b2
m=size(x,2);
X=zeros(2,m);
for j=1:1:m
    X(1,j)=x(j);
    X(2,j)=y(j);
end
E=A*X;
plot(E(1,:),E(2,:))
axis equal

%efecto de premultiplicar S por U %
subplot(2,3,6)
C=U*S;
c1=C(:,1);
c2=C(:,2);
plot([0,c1(1)],[0,c1(2)],'m')
hold on
plot([0,c2(1)],[0,c2(2)],'m')
title('Efecto de premultiplicar S por U')
%grafica de la elipse cuyos semiejes son c1 y c2
m=size(x,2);
X=zeros(2,m);
for j=1:1:m
    X(1,j)=x(j);
    X(2,j)=y(j);
end	
G=U*F;
plot(G(1,:),G(2,:))
axis equal