function orden = convergencia(n)
% Nos da el orden de convergencia
eN = zeros(length(n),1);
orden = zeros(length(n)-1,1);
for i=1:length(n)
    [~, eN(i)]=T6_ejercicio3_b (n(i),1); % Error en la norma Lp para cada n
end
for i=2:length(n)
    orden(i-1)= log2(eN(i-1)/eN(i)); % Orden de convergencia para cada error en la norma Lp
end

    

