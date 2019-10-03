f1 = inline('sinh(x)');
f2 = inline('cosh(x)');
n=1;
M=abs(f2(1));
r=((factorial(n+1))/2^(n+1));
e=10^(8);
while r<(M*e)
    n=n+1;
    if mod(n,2)==0
        M=abs(f1(1));
    else
        M=abs(f2(1));
    end
    r=((factorial(n+1))/2^(n+1));
end
fprintf('El menor grado es = %3i\n',n);
    