% Nombre del programa: Principal_Proy.m
% Autor(es): Sebastian Cortez - Valentina Cordova - Maria Fernanda Molina -
% Emil Vega
% Email del (los) autor(es): sebastian.cortez@yachaytech.edu.ec -
% airina.cordova@yachaytech.edu.ec maria.molina@yachaytech.edu.ec - 
% emil.vega@yachaytech.edu.ec
% Fecha de entrega: Julio 21 de 2016
% Breve descripcion del programa : El siguiente script calcula la imágen 
% aproximada de A, dependiendo de la cantidad de valores singulares (k) que
% se desee, asi como tambien grafica la imagen original A y la aproximada 
% de A. Además, si se desea se puede obtener una gráfica de los errores 
% relativos por cada color para distintos valores de k. 
% Datos de entrada:
% Nobre de la imagen original
% Núumero de valores singulares que se desean calcular
% Datos de salida:
% Imagen de A y aproximación de A y su error relativo para distintos valores de k.

clear
clc
%Se ingresa el nombre del archivo a aproximar 
imagen =input('Escriba el nombre de la imagen a aproximar \ncon su extención respectiva y entre comillas simples: ');
%imread transforma la imagen en una matriz
A=imread(imagen);
fprintf('El tamaño de su matriz es: %i\n', length(A))
k=input('Ingrese el número de valores singulares que desee: ');
%La matriz A conste de 3 matrices. Separamos cada una. Ar ( Matriz Color
%Rojo) Ag(Matriz color verde) Ab (Matriz Color Azul)
Ar = A(:, :, 1);
Ag = A(:, :, 2);
Ab = A(:, :, 3);

%Devuelve el valor de doble presicion de Ar,Ag,Ab
Ar= double(Ar);
Ag= double(Ag);
Ab= double(Ab);

%Realiza la Descomposicion deValores singulares de cada una de las matrices
[Ur,Sr,Vr]=SVD_proj(Ar,k);
[Ug,Sg,Vg]=SVD_proj(Ag,k);
[Ub,Sb,Vb]=SVD_proj(Ab,k);

%Calculamos la Aproximacion de cada color.
A_red=Ur*Sr*Vr';
A_green=Ug*Sg*Vg';
A_blue=Ub*Sb*Vb';

%Cambiando el tipo de dato
A_red = uint8(floor(A_red));
A_green = uint8(floor(A_green));
A_blue = uint8(floor(A_blue));

%Concatemamos las aproximaciones de las tres matrices de colores.
Aprox_image = cat(3, A_red, A_green, A_blue);

% Grafica de A real y A aproximada.
figure

subplot(1, 2, 1);
imshow(A);
title('Imagen Original');

subplot(1, 2, 2);
imshow(Aprox_image);
title('Imagen Comprimida');

% Gráfica de los valores singulares

% Preguntamos al usuario si desea presentar los valores singulares
r = input('¿Desea presentar los valores singulares? \nDigite 1 o 2: 1 = Si ; 0 = No: ');
if r==1 || r==0
    if r==1
        % Tranformamos la matriz diagonal de valores singulares en vector
        Sr=diag(Sr); 
        Sg=diag(Sg);
        Sb=diag(Sb);
        
        x=1:1:k;

        figure
        subplot(2,2,1)
        plot(x,Sr,'r')
        title('Valores singulares - Color rojo')
        xlabel('Posición de los valores singulares')
        ylabel('Valor singular')
        legend('Valores singulares')
        subplot(2,2,2)
        plot(x,Sg,'g')
        title('Valores singulares - Color verde')
        xlabel('Posición de los valores singulares')
        ylabel('Valor singular')
        legend('Valores singulares')
        subplot(2,2,3)
        plot(x,Sb,'b')
        title('Valores singulares - Color blue')
        xlabel('Posición de los valores singulares')
        ylabel('Valor singular')
        legend('Valores singulares')
    end
    fprintf('Gracias.. :) \n')
else
    fprintf('El valor ingresado debió ser 1 o 0.. :(\n')
end

% Preguntamos al usuario si desea presentar la comparación de errores
r = input('¿Desea comparar los errores? \nDigite 1 o 2: 1 = Si ; 0 = No: ');
if r==1 || r==0
    if r==1
        % c: Numero de valores singulares a comparar
        c=input('¿Cuántos k desea comparar?: ');
        % k2: Vector con el número de k para cada comparación
        k2=zeros(c,1);
        for i=1:c
            k2(i)=input('Ingrese el valor de k: ');
        end
        fprintf('Procesando...\n')
        % Función errores_proj que calcula el error relativo de la matriz
        % aproximada
        [error_red, error_green, error_blue] = errores_proj(A,k2);
    end
    fprintf('Gracias.. :) \n')
else
    fprintf('El valor ingresado debió ser 1 o 0.. :(\n')
end
% Guardamos la imagen en .mat
save('Aprox_image')