function [u,up]=T6_ejercicio2(n)
h=1/(n-1); % espacio entre puntos
x=[h:h:1-h]; % Puntos equidistantes
u = eval_fun('(exp(50*x)-1)/(exp(50)-1)',x); % Obtenemos la evalución de los puntos en la función
[~,up,~]=cds_EV(n); % Obtenemos la evaluación de los puntos en la función aproximada