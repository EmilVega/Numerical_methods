% -------------------------------------------------------------------------
% Nombre del programa: T6_ejercicio2.m
% Autor(es): Valentina Cordova - Emil Vega
% Email del (los) autor(es): airina.cordova@yachaytech.edu.ec -
% emil.vega@yachaytrech.edu.ec
% Fecha de elaboracion: Julio 6 2016
% Breve descripcion del programa: calcula 'u'
% Datos de entrada:
% ----------------
% n: nodos equidistantes
%____________
% Datos de salida
% ---------------
% u : vector con los valores arrojados por la función

% ------------------------------------------------------------------------
function [u,up]=T6_ejercicio2(n)
h=1/(n-1); % espacio entre puntos
x=[h:h:1-h]; % Puntos equidistantes
u = eval_fun('(exp(50*x)-1)/(exp(50)-1)',x); % Obtenemos la evalución de los puntos en la función
[~,up,~]=cds_EV(n); % Obtenemos la evaluación de los puntos en la función aproximada