function [x iter]=Gauss_Seidel_NEW(A,b)
% Resolución por Gauss-Seidel (compacto)
D=diag(diag(A)); L=-tril(A,-1); U=-triu(A,1);
n=size(A,1); x=zeros(n,1); iter=0; sm=1;
while sm>0.001
    y = (D-L)\(U*x + b);
    sm=norm(abs(y-x),inf); 
    iter=iter+1;
    x = y;
end
end