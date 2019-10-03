function [x,iter] = Gauss_Seidel_ZC(A,b, x0, tol, maxiter);
% Se resuelve el sistema lineal Ax=b usando el m�todo iterativo de Jacobi.
% Par�metros de estrada:
% A, b : Matriz de los coeficientes y vector independiente respectivamente
% x0: Iterado Inicial
% tol: tolerancia aceptada en la soluci�n (define la condici�n de parada de
% las iteraciones)
% maxiter: No m�ximo de iteraciones permitidas
%Date: April 2016
%Author: Z. Castillo

[~,n]= size(A); iter=0; conv=0; x = x0;
while conv == 0 && iter < maxiter
    iter = iter+1;
    for i=1:n
        suma1 = 0;
        for j=1:i-1
            suma1 = suma1 + A(i,j)*x(j);
        end
        suma2=0;
        for j=i+1:n
            suma2 = suma2 + A(i,j)*x0(j);
        end
        x(i)=(b(i)-suma1-suma2)/A(i,i);
    end
    
    if norm(x-x0)/norm(x,'inf') < tol
        conv = 1;
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