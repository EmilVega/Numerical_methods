function [x,u,xx]=cds_EV(n)
h=1/(n-1); %Espacio entre puntos
x=[0:h:1]; %Vector de puntos equidistantes
xx= x(2:n-1); %Vector sin el valor inicial y final
x=x';
xx=xx';
alpha = -(25*h+1); %Alfa definido a través del esquema central en diferencias finitas
beta=2; %Beta definido a través del esquema central en diferencias finitas
gamma=25*h-1; %Gamma definido a través del esquema central en diferencias finitas
A=diag(gamma*ones(1,n-3),1)+diag(alpha*ones(1,n-3),-1)+diag(beta*ones(1,n-2),0);
b=zeros(n-2,1);
b(n-2)=-gamma; % b en la ultima posición es -gamma
u=A\b;

