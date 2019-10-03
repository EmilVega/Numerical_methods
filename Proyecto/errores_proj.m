function [error_red, error_green, error_blue] = errores_proj(A,k)
% Nombre del programa: Principal_Proy.m
% Autor(es): Sebastian Cortez - Valentina Cordova - Maria Fernanda Molina -
% Emil Vega
% Email del (los) autor(es): sebastian.cortez@yachaytech.edu.ec -
% airina.cordova@yachaytech.edu.ec maria.molina@yachaytech.edu.ec - 
% emil.vega@yachaytech.edu.ec
% Fecha de entrega: Julio 21 de 2016
% Breve descripcion del programa : La siguiente función calcula los errores
% para cada color  
% Datos de entrada:
% A: Matriz original
% k: Vector de número de valores sigulares
% Datos de salida:
% Tres vectores de error para cada color dependiendo de k

A=double(A);
n=length(k);

%La matriz A conste de 3 matrices. Separamos cada una. Ar ( Matriz Color
%Rojo) Ag(Matriz color verde) Ab (Matriz Color Azul)
Ar = A(:, :, 1);
Ag = A(:, :, 2);
Ab = A(:, :, 3);

%Devuelve el valor de doble presicion de Ar,Ag,Ab
Ar= double(Ar);
Ag= double(Ag);
Ab= double(Ab);

error_red=zeros(n,1);
error_green=zeros(n,1);
error_blue=zeros(n,1);

for i=1:n
    %Realiza la Descomposicion de Valores singulares de cada una de las matrices
    [Ur,Sr,Vr]=SVD_proj(Ar,k(i));
    [Ug,Sg,Vg]=SVD_proj(Ag,k(i));
    [Ub,Sb,Vb]=SVD_proj(Ab,k(i));
    
    %Calculamos la Aproximacion de cada color.
    A_red=Ur*Sr*Vr';
    A_green=Ug*Sg*Vg';
    A_blue=Ub*Sb*Vb';
    
    % Cálculo del error
    error_red(i)=norm(Ar - A_red,'fro')/norm(Ar,'fro');
    error_green(i)=norm(Ag- A_green,'fro')/norm(Ag,'fro');
    error_blue(i)=norm(Ab - A_blue,'fro')/norm(Ab,'fro');
    
end

% Gráfica de los errores por color
figure
subplot(2,2,1)
plot(k,error_red,'r')
title('Error rojo vs Cantidad de valores singulares')
xlabel('k (Cantidad de valores singulares)')
ylabel('Error relativo')
legend('Error rojo')
subplot(2,2,2)
plot(k,error_green,'g')
title('Error verde vs Cantidad de valores singulares')
xlabel('k (Cantidad de valores singulares)')
ylabel('Error relativo')
legend('Error verde')
subplot(2,2,3)
plot(k,error_blue,'b')
title('Error azul vs Cantidad de valores singulares')
xlabel('k (Cantidad de valores singulares)')
ylabel('Error relativo')
legend('Error azul')
