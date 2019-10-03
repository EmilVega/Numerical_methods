function [x,iter]= sor(A, b, x0, w, maxiter, tol)
% Esta funci�n implementa el m�todo iterativo de Sobrerelajaci�n.
% SOR para resolver un sistema de ecuaciones lineales Ax=b
%Par�metros de Entrada:
% A, b: Matriz A de los coeficientes y vector independiente b
% x0: iterado inicial
% w: Par�metro de relajaci�n 0 < w < 2
% maxiter: M�ximo n�mero de iteraciones permitida
% tol : Tolerancia exigida
% Par�metros de salida
% iter: n�mero de iteraciones realizadas
% x: soluci�n aproximada en "iter" iteraciones
% Date  08/05/2016
% Autor: Zenaida Castillo
% Instituci�n: Yachay Tech

[~,n]=size(A); conv = 0; iter=0; x=x0;
if w <=0 || w > 2 
    error('El p�rametro de relajaci�n debe estar entre 0 y 2');
end
if any(abs(diag(A))<eps)
    error('El m�todo no puede aplicarse. Elemento diagonal nulo')
end
iter=0; conv=0;
while conv==0 && iter <= maxiter
    iter=iter+1;
    for i=1:n
        j=[1:i-1 i+1:n];
        suma = b(i)-A(i,j)*x(j);
        x(i)= (1-w)*x(i) + w*suma/A(i,i);
    end
    if norm(x-x0) < tol
        conv = 1;
    else
        x0=x;
    end
end
if iter < maxiter
   fprintf('\n SOR CONVERGE en %d iteraciones\n',iter),
   return
else
   fprintf('\n SOR NO CONVERGE en %d iteraciones\n',iter),
end