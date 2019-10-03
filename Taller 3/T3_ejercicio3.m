A=[4 -1 0 -1 0 0;-1 4 -1 0 -1 0;0 -1 4 0 0 -1;-1 0 0 4 -1 0;0 -1 0 -1 4 -1;0 0 -1 0 -1 4];
b=[1;0;0;0;0;0];
X0=[1;1;1;1;1;1];
% Para correr esta parte necesitamos desactivar el condicionamiento de SOR 
% para 0 < w < 2.

% [x,iter]= sor(A, b, X0, -2, 1000, 10^-7) 
% [x,iter]= sor(A, b, X0, 3, 1000, 10^-7)

w = [1:0.01:1.96];

L = tril(A,-1);
U = triu(A,+1);
D = diag(diag(A));
Bj = inv(D) * (L+U);


n = length (w);
rkNorm = zeros(n,1);
for i=1:n
    [x,~]= sor(A, b, X0, w(i), 1000, 10^-7);
    rk = b - A*x;
    rkNorm(i) = norm(rk);
end

hold on
plot (w,rkNorm,'g')
radEsp = max(abs(eig(Bj)));
w1 = 2/(1+sqrt(1-radEsp^2));
[x1,~]= sor(A, b, X0, w1, 1000, 10^-7);
rk = b - A*x1;
rkNorm1 = norm(rk);
plot (w1,rkNorm1,'rp')
xlabel('Parámetro de relajación (w)')
ylabel ('Norma de los residuales (rk)')
hold off

