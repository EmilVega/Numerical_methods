function T6_ejercicio3_a(n)
[~,up,xx]=cds_EV(n); % se obtiene los valores la función aproximada y el vector x que va desde i=2 hasta n-1
u=T6_ejercicio2(n); % Se obtiene los valores en la función real
hold on
plot (xx,u)
plot (xx,up)
str = sprintf('Grafica de u(x) real y aproximada para los nodos n = %i',n);
title(str)
xlabel('x=(h:h:1-h')
ylabel('up(x) & u(x)')
legend('u(x)','up(x)')
hold off
