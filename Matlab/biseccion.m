function [x,niter,tiempo] = biseccion (funcion, a, b, tol, nitmax)
to=cputime; % cputime: obtiene la hora del sistema
niter=0; %niter: contador para el numero de iteraciones
f = inline (funcion); % inline: convierte en función el string ingresado
if (f(a)*f(b))<0 %condicionamos que se cumpla la hipótesis del teorema de Bolzano
    x=a; % almacenamos el valor de 'a' en una variable auxiliar
    while abs (f(x))>tol && niter<nitmax % comparamos que el valor absoluto de la función evaluada en 'x' sea mayor que la tolerancia y el numero de iteraciones sea menor que el numero de iteraciones máximas
        niter=niter+1; % Se incrementa el contador en 1.
        x = (a+b)/2; %obtemos el nuevo valor de 'x'.
        if (f(a)*f(x))<0 %Condicionamos que se cumpla del Teorema de Bolzano
            b=x; %corremos el valor de 'b' hacia el nuevo 'x' obtenido
        else
            a=x; %corremos el valor de 'a' hacia el nuevo 'x' obtenido
        end
    end
else
    x ='no satisface las hipotesis del T.B.';
end
tf=cputime;
tiempo=tf-to; %corremos el valor de 'b' hacia el nuevo 'x' obtenido