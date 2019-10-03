function [ps,iter] = Eval_Punto_Fijo_ZC(p0,tol,nmaxiter)
% Funci�n que eval�a varios esquemas de punto fijo en la soluci�n de:
%             x^3 + 4x^2 -10 = 0
% Entrada:
% p0: Iterado inicial (o approx inicial al punto fijo)
% tol: Tolerancia para el criterio de parada
% nmaxiter: N�mero m�ximo de iterac�ones permitidas
% Salida
% ps: vector que contiene la secuencia de iterados
% iter: No de iteraciones realizadas
% Autor: Z. Castillo
% Fecha: 13/07/2016

% Esquemas de Punto Fijo
%g1 = inline('x-x^3-4*x^2+10'); g=g1;
%g2 = inline('sqrt((10/x) -4*x)'); g=g2;
%3 = inline('0.5*(sqrt(10-x^3))'); g=g3;
%g4 = inline('sqrt(10/(4+x))'); g=g4;
g5 = inline('x-((x^3+4*x^2-10)/(3*x^2+8))'); g=g5;

iter=0; conv=0; gp0 = g(p0); ps=[p0];
while conv ==0 && iter < nmaxiter
    iter = iter+1;
    p = gp0; gp = g(p); ps = [ps;p];
    error = abs(gp-p);
    if error < tol
        conv = 1;
    else
        p0 = p; gp0=gp;
    end
end