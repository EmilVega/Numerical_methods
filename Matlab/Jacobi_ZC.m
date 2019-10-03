function [x,iter] = Jacobi_ZC(A,b, x0, tol, maxiter);
% Se resuelve el sistema lineal Ax=b usando el método iterativo de Jacobi.
% Parámetros de estrada:
% A, b : Matriz de los coeficientes y vector independiente respectivamente
% x0: Iterado Inicial
% tol: tolerancia aceptada en la solución (define la condición de parada de
% las iteraciones)
% maxiter: No máximo de iteraciones permitidas
%Date: April 2016
%Author: Z. Castillo

[m,n]= size(A); iter=0; conv=0; x = zeros(n,1);

while conv == 0 & iter < maxiter
    iter = iter+1;
    for i=1:n
        j = [1:i-1 i+1:n];
        x(i) = (b(i) -A(i,j)*x0(j))/A(i,i);
    end
    if norm(x-x0)/norm(x,'inf') < tol
        conv = 1
    else
        x0=x;
    end
end
if iter == maxiter
    disp('Numero maximo de iteraciones alcanzado');
else
    fprintf('it = %3i\n',iter);
    x
end;    