function [p,iter] = Punto_Fijo_ZC(funciong, p0, tol, nmaxiter)
g = inline(funciong); 
iter=0; conv=0; gp0 = g(p0);
plot(p0,gp0,'bo-');
while conv ==0 && iter < nmaxiter
    iter = iter+1;
    p = gp0; gp = g(p);
    plot([p0; p],[gp0; gp],'bo-');
    error = abs(gp-p);
    if error < tol
        conv = 1;
    else
        p0 = p; gp0=gp;
    end
    plot(p,gp,'bo-');
end
