function [U,S,V]=SVD_proj(A,k)
% Nombre del programa: SVD_proj.m
% Autor(es): Sebastian Cortez - Valentina Cordova - Maria Fernanda Molina -
% Emil Vega
% Email del (los) autor(es): sebastian.cortez@yachaytech.edu.ec -
% airina.cordova@yachaytech.edu.ec maria.molina@yachaytech.edu.ec - 
% emil.vega@yachaytech.edu.ec
% Fecha de entrega: Julio 21 de 2016
% Breve descripcion del programa : La siguiente función realiza la
% descomposición en valores singulares de una matriz
% Datos de entrada:
% A: Matriz a aproximar
% k: Número de valores singulares para la aproximación
% Datos de salida:
% U: Matriz formada a partir de S y V
% S: Matriz diagonal con los valores singulares
% V: Matriz con los autovectores ortonormalizados

% Condicionamos que k debe ser menor que el tamaño de la matriz A
if k > length(A)
    fprintf('El número de autovalores debe ser menor o igual al tamaño de la matriz')
else
    % AD es una deflación de A
    AD = A*A'; 
    lambda = zeros(1,k);
    V=zeros(length(A),k);
    S=zeros(k,k);
    U=zeros(length(A),k);
    for i=1:k
        % El método de Hotelling nos da los autovalores y los autovectores
        [AD,lambda(i),x1] = Def_Hotelling (AD); 
        % Encontramos el valor singular y lo guardamos en la matriz S
        S(i,i) = sqrt(lambda(i));
        % Invocamos el código Inv_Pow para obtener una mejor aproximación
        % del autovector. Pasamos como paŕametro sigma = lambda + epsilon; 
        % con epsilon una pequeña perturbación
        [~,x1,~]= Inv_Pow_Z(A'*A,lambda(i)+1e-3,1e-10,1000,x1); 
        % Guardamos el autovector obtenido en la matriz V
        V(:,i)=x1;
    end
    % Ortonormalizamos las columnas de la matriz V mediante la función de 
    % gram_schmidt
    V = gram_schmidt (V); 
    for i=1:k
        % Obtenemos la matriz U a partir de S y V
        U(:,i) = (A*V(:,i))/S(i,i);
    end
    % Ortonormalizamos las columnas de la matriz U mediante la función de 
    % gram_schmidt
    U=gram_schmidt (U);
end


