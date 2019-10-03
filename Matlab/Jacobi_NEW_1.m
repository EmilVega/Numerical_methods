function [x iter]=Jacobi_NEW_1(A,b)
% Resuelve Ax=b por Jacobi (compacto)
n=length(b); x=zeros(n,1); iter=0; sm=1;
d=diag(A);
r=A-diag(d);
while sm>0.001
    y = (b-r*x)./d;
    sm=max(abs(x-y))/max(abs(y));
    x = y;
    iter = iter+1;
end
end