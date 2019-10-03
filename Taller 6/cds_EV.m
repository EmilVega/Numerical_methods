% -------------------------------------------------------------------------
% Nombre del programa: cds_EV.m
% Autor(es): Valentina Cordova - Emil Vega
% Email del (los) autor(es): airina.cordova@yachaytech.edu.ec -
% emil.vega@yachaytrech.edu.ec
% Fecha de elaboracion: Julio 6 2016
% Breve descripcion del programa: calcule una solución aproximada para 
%la ecuación unidimensional estacionaria de convecci´on-difusión.
% Datos de entrada:
% ----------------
% n: nodos 
%____________
% Datos de salida
% ---------------
% u: solución exacta
% x: intervalo [0,..,1]
% xx: intervalo [x_2,..,x_n-1]

% ------------------------------------------------------------------------
function [x,u,xx,A]=cds_EV(n)
h=1/(n-1); 
x=[0:h:1]; 
xx= x(2:n-1);
x=x';
.00xx=xx';
alpha = -(25*h+1);
beta=2;
gamma=25*h-1;
A=diag(gamma*ones(1,n-3),1)+diag(alpha*ones(1,n-3),-1)+diag(beta*ones(1,n-2),0)
b=zeros(n-2,1);
b(n-2)=-gamma
u=A\b;

