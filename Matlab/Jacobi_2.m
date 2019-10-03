function [x k]=Jacobi_2(A,b)
% Resuelve Ax=b por Jacobi
n=size(A,1); x=zeros(n,1); y=x; sm=1; k=0;
while sm>=0.001
    k=k+1;
    for i=1:n
        j = [1:i-1 i+1:n];
        y(i)=(b(i)-A(i,j)*x(j))/A(i,i);
    end
    sm=max(abs(x-y))/max(abs(y));
    x=y;
end
end