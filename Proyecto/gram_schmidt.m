function Q = gram_schmidt (A)
% Nombre del programa: gram_scgmidt.m
% Autor(es): Sebastian Cortez - Valentina Cordova - Maria Fernanda Molina -
% Emil Vega
% Email del (los) autor(es): sebastian.cortez@yachaytech.edu.ec -
% airina.cordova@yachaytech.edu.ec maria.molina@yachaytech.edu.ec - 
% emil.vega@yachaytech.edu.ec
% Fecha de entrega: Julio 21 de 2016
% Breve descripcion del programa : La siguiente función realiza la
% ortonormalización de las columnsas de A
% Datos de entrada:
% A: Matriz a ortonormalizar
% Datos de salida:
% Q: Matriz ortonormalizada

[m,n]=size(A);
Q=zeros(m,n);
R=zeros(n,n);
for j=1:n
    % Inicializamos la primera columna de Q
    v=A(:,j);
    for i=1:j-1
        % Realizamos la resta dependiendo de las columnas de A
        R(i,j)=Q(:,i)'*A(:,j);
        % Guardamos el nuevo valor de v
        v=v-R(i,j)*Q(:,i);
    end
    % Guardamos la norma de v
    R(j,j)=norm(v);
    % Creamos nuetra matriz Q ortonormalizada dividiendo el vector v por la
    % norra del mismo.
    Q(:,j)=v/R(j,j);
end
 