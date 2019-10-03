function [AD,lambda,v1] = Def_Hotelling (A)
% Este programa calcula el autovalor de módulo máximo de A orden n 
% ( k <= n) via Método de la potencias. 
% Devuelve el autopar (lambda,x) y una matriz similar AD que
% representa una deflación de A por el método de Hotelling. 
% Si el espectro de A es {l1,l2, ...,ln} tal que:
% |l1| > |l2| >= ....|ln| entonces el espectro de AD es
% {0,l2,l3,...,ln}
% 
% Input:
%        A:  Una matriz simétrica de orden n
% Output:
%
% Autor: Zenaida Castillo
% Fecha: 11/07/2016

[m,n]= size(A);
if n ~=m 
    disp('Matriz A debe ser cuadrada'); 
    return; 
end;

tol=1e-30; maxit=100000;
x0=randn(n,1);
[lambda,x,iter]=Power_method_Z(A,tol,maxit,x0);
if iter >= maxit
    disp('no convergencia');
end

v1=x/norm(x);
% Proceso de deflacion
AD = A -lambda*(v1*v1');


