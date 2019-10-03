function [AD,lambda,v1] = Def_Hotelling (A)
% Este programa calcula el autovalor de m�dulo m�ximo de A orden n 
% ( k <= n) via M�todo de la potencias. 
% Devuelve el autopar (lambda,x) y una matriz similar AD que
% representa una deflaci�n de A por el m�todo de Hotelling. 
% Si el espectro de A es {l1,l2, ...,ln} tal que:
% |l1| > |l2| >= ....|ln| entonces el espectro de AD es
% {0,l2,l3,...,ln}
% 
% Input:
%        A:  Una matriz sim�trica de orden n
% Output:
%
% Autor: Zenaida Castillo
% Fecha: 11/07/2016

[m,n]= size(A);
if n ~=m 
    disp('Matriz A debe ser cuadrada'); 
    return; 
end;

tol=1e-10; maxit=100000;
x0=randn(n,1);
[lambda,x,iter]=Power_method_Z(A,tol,maxit,x0);
if iter >= maxit
    disp('no convergencia');
end

v1=x/norm(x);
% Proceso de deflacion
AD = A -lambda*(v1*v1');


