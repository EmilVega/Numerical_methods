% Este programa es un ejemplo de c�mo puede aproximarse una imagen 
% usando la Descomposi�n en Valores Singulares truncada; es decir
% representada por solo k de los valores singulares de la matriz
% que representa la imagen.
% Autor: Z. Castillo
% Fecha: 12/07/2016

% Instrucciones de Inicio
close all
clear all
clc

original_image = imread('house.tiff');
% figure
% imshow(original_image);

k = input('Introduzca el valor de k = ');

% Descomposici�n de la imagen por tonos (RGB)
red_channel   = original_image(:, :, 1);
green_channel = original_image(:, :, 2);
blue_channel  = original_image(:, :, 3);

% Preparando las matrices para su procesamiento
A_red   = double(red_channel);
A_green = double(green_channel);
A_blue  = double(blue_channel);

% Hallando la svd parcial de cada m�dulo de la imagen
% En las proximas intrucciones el comando svd debe ser sustituido por
% la soluci�n planteada. Ejemplo
% [Uk,Sk,Vk] = Partial_SVD(A_red,k);
%  Ak_red = Uk*Sk*Vk';

[U, S, V] = svd(A_red);   % svd de la imagen en rojo
Uk=U(:,1:k); Sk=S(1:k,1:k); Vk =V(:,1:k);
Ak_red = Uk*Sk*Vk';       % Descomposici�n parcial de la imagen en rojo

[U, S, V] = svd(A_green);   % svd de la imagen en verde
Uk=U(:,1:k); Sk=S(1:k,1:k); Vk =V(:,1:k);
Ak_green = Uk*Sk*Vk';       % Descomposici�n parcial de la imagen en verde

[U, S, V] = svd(A_blue);   % svd de la imagen en azul
Uk=U(:,1:k); Sk=S(1:k,1:k); Vk =V(:,1:k);
Ak_blue = Uk*Sk*Vk';       % Descomposici�n parcial de la imagen en azul

% C�lculo del error
error_red=norm(A_red - Ak_red)/norm(A_red);
error_green=norm(A_green - Ak_green)/norm(A_green);
error_blue=norm(A_blue - Ak_blue)/norm(A_blue);

% Preparando la imagen para efectos de impresi�n
Ak_red = uint8(floor(Ak_red));
Ak_green = uint8(floor(Ak_green));
Ak_blue = uint8(floor(Ak_blue));

% Concatenando las im�genes de los tres colores (RGB)

Aprox_image = cat(3, Ak_red, Ak_green, Ak_blue);

% Mostrando la soluci�n
figure;

subplot(1, 2, 1);
imshow(original_image);
title('Imagen Original');

subplot(1, 2, 2);
imshow(Aprox_image);
title('Imagen Comprimida');
