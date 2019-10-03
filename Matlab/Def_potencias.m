function [A, autoval] = Def_potencias (A,k);
% Este programa calcula k autovalores de una matriz sim�trica A de 
% orden n ( k <= n)
% Input:
%        A:  Una matriz sim�trica de orden n
%        k:  numero de autovalores deseados

[m,n]= size(A);
if n ~=m disp('Matriz A debe ser cuadrada'); return; end;
if k > n disp('k debe ser menor o igual a n'); return; end;

tol=1e-14; maxit=1000; cont=0; nn=n;
autoval=[]; 
while nn  > 2 & cont < k
    x0=randn(nn,1);
    % Se calcula el pr�ximo autovalor
    [lambda,x,i]=Power_method_Z(A,tol,maxit,x0);
    autoval = [autoval; lambda]; cont=cont + 1; 
    % Se construye la matriz de Householder
    e1=eye(nn,1);u=x-norm(x)*e1;
    H=eye(nn)-2*(u*u')/(u'*u);
    % Se aplica transformaci�n de similaridad
    B=H'*A*H;
    % Preoceso de deflacion
    A = B(2:nn,2:nn); nn=nn-1; 
end

% En este punto o bien se han calculado los k autovalores deseados o
% se tiene una matriz deflactada de 2x2 cuyos autovalores se obtienen
% directamente de la f�rmula conocida.

if cont==k 
    %fprintf('%3i autovalores calculados exitosamente \n',k);
    return;
end
% Se calculan los dos �ltimos autovalores de la matriz deflactada de 2x2
% Si A es de 2x2 su polinomio caracter�stico es:
% lam^2 - (A11+A22)*lam + det(A) y sus raices pueden calcularse usando la
% ecuaci�n cuadr�tica.

b=A(1,1)+A(2,2); c=A(1,1)*A(2,2)-A(1,2)^2;;
lambda = (b + sqrt(b^2 - 4*c))/2;
%fprintf('it = %3i, lambda = %12.5e\n',1,lambda);

autoval = [autoval; lambda]; cont=cont+1;
lambda = (b - sqrt(b^2 - 4*c))/2;

%fprintf('it = %3i, lambda = %12.5e\n',1,lambda);

autoval = [autoval; lambda]; cont=cont+1;
%fprintf('%3i autovalores calculados exitosamente \n',cont);
