% -------------------------------------------------------------------------
% Nombre del programa: T6_ejercicio3_b.m
% Autor(es): Valentina Cordova - Emil Vega
% Email del (los) autor(es): airina.cordova@yachaytech.edu.ec -
% emil.vega@yachaytrech.edu.ec
% Fecha de elaboracion: Julio 6 2016
% Breve descripcion del programa: Halla la norma infinito y lp del error.
% Datos de entrada:
% ----------------
% n: valor de un nodo
% p: 1 o 2
%____________
% Datos de salida
% ---------------
% eNorInf: Error en la norma infinito
% tC: Trapecio compuesto (Diferencias finitas)

% ------------------------------------------------------------------------
function [eNorInf, tC]=T6_ejercicio3_b (n,p)
% Error en la norma infinito
[~,up,xx]=cds_EV(n); % se obtiene los valores la función aproximada y el vector x que va desde i=2 hasta n-1
u=T6_ejercicio2(n); % Se obtiene los valores en la función real
error=u-up; % Error absoluto
eNorInf = norm(error,inf); %norma infinito

%Error en la norma Lp
h=1/n;
f=abs((u-up)).^p; % f es el valor absoulto elevado a la p del error 
tC=(h*(sum(f(2:n-3)))+((h/2)*(f(1)+f(n-2)))); % Aplicamos la regla del trapecio compuesto
%eNorLp=tC^(1/p); % eNorInf es el error en la norma Lp
