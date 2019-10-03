A=[5 2 3; 2 6 -1; 1 1 8]
[L,U]=lu(A)
[det(A) det(L) det(U) det(L)*det(U)]

% OBSERVACIONES:
% Por definición para una matriz triangular su determinante es la
% multiplicación de su diagonal. La matriz L es un caso especial debido a 
% que los valores de su diagonal son 'unos'. En este sentido el
% determinante de A obtenido por la eliminación de Gauss es igual al de U, 
% y la multiplicación del determinante de L (que es uno) por el determinante
% de U es también igual al determinante de A. 

A2 = [eps/3 1 1;1 1 0;1 0 1]
determinante = det(A2)
n=3;
Ap = [1 0 1;1 1 0;eps/3 1 1] % Matriz cambiado el pivote
U2=Ap;
m21 = U2(2,1)/U2(1,1);
E21 = eye(n);
E21(2,:) = E21(2,:)-m21*E21(1,:);
U2=E21*U2;
m31 = U2(3,1)/U2(1,1);
E31 = eye(n);
E31(3,:)= E31(3,:)-m31*E31(1,:);
U2=E31*U2;
m32=U2(3,2)/U2(2,2);
E32=eye(n);
E32(3,:)= E32(3,:)-m32*E32(2,:);
U2=E32*U2
L2=eye(n);
L2(2,1)=m21;
L2(3,1)=m31;
L2(3,2)=m32
L2xU2 = L2*U2
Ap
[det(Ap) det(L2) det(U2) det(L2)*det(U2)]

% OBSERVACIONES:
% En principio tuvimos que hacer un pivoteo parcial, debido a que en la 
% primera posición había un pivote que no es cero, que para matlab es 
% cero.Cambiamos la ultima fila por la primera.
% Por definición para una matriz triangular su determinante es la
% multiplicación de su diagonal. La matriz L2 es un caso especial debido a 
% que los valores de su diagonal son 'unos'. En este sentido el
% determinante de Ap obtenido por la eliminación de Gauss es igual al de U2, 
% y la multiplicación del determinante de L2 (que es uno) por el determinante
% de U2 es también igual al determinante de Ap. 