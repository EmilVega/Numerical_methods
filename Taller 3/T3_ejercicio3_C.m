A=[4 -1 0 -1 0 0;-1 4 -1 0 -1 0;0 -1 4 0 0 -1;-1 0 0 4 -1 0;0 -1 0 -1 4 -1;0 0 -1 0 -1 4];
b=[1;0;0;0;0;0];
X0=[1;1;1;1;1;1];
L = tril(A,-1);
U = triu(A,+1);
D = diag(diag(A));
Bj = inv(D) * (L+U);
radEsp = max(abs(eig(Bj)));
w1 = 2/(1+sqrt(1-radEsp^2));
[xG iterG]=Gauss_Seidel_NEW(A,b)
[xJ iterJ]=Jacobi_NEW_1(A,b)
[xS,iterS]= sor(A, b, X0, w1, 1000, 10^-7)