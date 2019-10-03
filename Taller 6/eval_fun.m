% -------------------------------------------------------------------------
% Nombre del programa: eval_fun.m
% Autor(es): Valentina Cordova - Emil Vega
% Email del (los) autor(es): airina.cordova@yachaytech.edu.ec -
% emil.vega@yachaytrech.edu.ec
% Fecha de elaboracion: Julio 6 2016
% Breve descripcion del programa: Evalua una función en un vector de valores.
% Datos de entrada:
% ----------------
% fun: función
% valor: vector
%____________
% Datos de salida
% ---------------
% u: vector solución

% ------------------------------------------------------------------------
function u = eval_fun(fun,valor)
% Esta funciÃ³n devuelve la evaluación de un vector de valores
% El parÃ¡metro fun debe ser ingresado como string
f=inline(fun); %Convertimos la cadena de string en una función
n = length(valor);
u=zeros(n,1);
for i=1:n
    u(i)=f(valor(i)); % Evaluamos cada valor en la funciÃ³n
end