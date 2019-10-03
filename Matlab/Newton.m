function [x,niter,tiempo]=Newton (funcion,fprima,xi,tol,nitmax)
to=cputime; % cputime: obtiene la hora del sistema
f = inline (funcion); % inline: convierte en función el string ingresado
fder=inline (fprima);
niter=0; %niter: contador para el numero de iteraciones
conv=0; %conv: lo usamos como bandera para saber cuando el método converge o no. Siendo conv=0 no converge.
while conv==0 && niter<nitmax 
    niter=niter+1; % Se incrementa el contador en 1.
    x=xi-(f(xi)/fder(xi)); % Asignamos un nuevo valor a 'x'mediante el teorema de Taylor
    if abs(x-xi)<tol %Comparamos si el valor absoluto de la diferencia es menor que la tolerancia
        conv=1; 
    else
        xi=x; % reasignamos el valor inicial a nuestro nuevo 'x' encontrado
    end
end
tf=cputime; 
tiempo=tf-to;%corremos el valor de 'b' hacia el nuevo 'x' obtenido