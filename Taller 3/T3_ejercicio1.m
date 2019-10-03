function T3_ejercicio1(e)

A=[1 1 1;e 0 0;0 e 0;0 0 e];
b=[3;e;e;e];
X1=[1;1;1];

AtA = A'*A;
Atb= A'*b;

Acond = cond(AtA)
X2= AtA\Atb;

L=chol(AtA); %No se puede calcular a partir de e>10^-8 debido a que la
%matriz no está definida de manera positiva.
L'*L;
c=L'\Atb;
Xc=L\c
rc = b - A*Xc;
ec = X1-Xc;
Nrc = norm(rc)
Nec = norm(ec)

[Q,R] = qr(A);
Xf=R\(Q'*b);
rf = b - A*Xf;
ef = X1 - Xf;
Nrf = norm(rf)
Nef = norm(ef)

[Q,R] = qr(A,0)

Xr = R\(Q'*b);
rr = b - A*Xr;
er = X1 - Xr;
Nrr = norm(rr)
Ner = norm(er)




