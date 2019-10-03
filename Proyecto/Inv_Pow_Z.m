function [mu,x1,it]= Inv_Pow_Z(A,sigma,tol,maxit,x0)
%=============================================================
% Inverse Iteration method: Computes the eigenvalue/eigenvector 
% closest to sigma.
%Input:     A, the matrix.
%           sigma, the shift.
%           tol, a tolerance for stopping criteria.
%           maxit, the maximun number of itertions allowed.
%           x0, an initial guess for the eigenvector.
%Output:    mu, an approximation to the eigenvalue closest 
%           to sigma.
%           x1, an approximation to the associate eigenvector.
%           it, iterations required to coverge. 
%
%Date: April, 2016
%Author: Z. Castillo
%=============================================================
n = length(A);
[L,U]=lu(A-sigma*eye(n)); conv=0; it=0; naf=norm(A,'fro');
while (conv==0 & it < maxit)
    it = it+1;
    y = U\(L\x0);
    x1 = y/norm(y);
    w = x0/norm(y);
    rho = x1'*w;
    mu = sigma+rho;
    r = w -rho*x1;
    x0=x1;
    if ((norm(r)/naf) < tol) conv=1; end;
end;
if i==maxit
    disp('Numero maximo de iteraciones alcanzado');
else
    %fprintf('it = %3i, lambda = %12.5e\n',it,mu);
end;    