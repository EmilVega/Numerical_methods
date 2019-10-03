function [lambda,x,i]=Power_method_Z(A,tol,maxit,x0)
%=============================================================
% Power method: Computes the eigenvalue/eigenvector of 
% largest module.
%Input:     A, the matrix.
%           tol, a tolerance for stopping criteria.
%           maxit, the maximun number of itertions allowed.
%           x0, an initial guess for the eigenvector.
%Output:    lambda, an approximation to the eigenvalue of the 
%           largest module.
%           x, an approximation to the associate eigenvector.
%           i, iterations required to coverge. 
%
%Date: April, 2016
%Author: Z. Castillo
%=============================================================
[m,n]=size(A); lambda0=inf; naf=norm(A,'fro');
if m~=n
    disp('A no es cuadrada');
    return;
end;
conv=0; i=0;
while conv==0 && i < maxit
    i=i+1;
    y = A*x0;
    if norm(y) < 1e-10 
        lambda=0;
        return;
    end;
    x = y/norm(y);
    w=x0/norm(y);
    lambda=x'*A*x;
    if ((norm(x-x0)/naf < tol) || (abs(lambda-lambda0)/naf < tol)) 
        conv=1; 
    end
    x0=x;  lambda0=lambda;
end;
if i==maxit
    disp('Numero maximo de iteraciones alcanzado');
else
    %fprintf('it = %3i, lambda = %12.5e\n',i,lambda);
end;