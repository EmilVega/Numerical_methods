function u = eval_fun(fun,valor)
% Esta función devuelve la evaluación de un vector de valores
% El parámetro fun debe ser ingresado como string
f=inline(fun); %Convertimos la cadena de string en una función
n = length(valor);
u=zeros(n,1);
for i=1:n
    u(i)=f(valor(i)); % Evaluamos cada valor en la función
end