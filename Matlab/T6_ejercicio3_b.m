function [eNorInf, eNorLp]=T6_ejercicio3_b (n,p)
% Error en la norma infinito
[~,up,xx]=cds_EV(n); % se obtiene los valores la función aproximada y el vector x que va desde i=2 hasta n-1
u=T6_ejercicio2(n); % Se obtiene los valores en la función real
error=u-up; % Error absoluto
eNorInf = norm(error,inf); %norma infinito

%Error en la norma Lp
h=1/n;
f=abs(error).^p; % f es el valor absoulto elevado a la p del error 
tC=(h*(sum(f(2:n-3)))+((h/2)*(f(1)+f(n-2)))); % Aplicamos la regla del trapecio compuesto
eNorLp=tC^(1/p); % eNorInf es el error en la norma Lp
