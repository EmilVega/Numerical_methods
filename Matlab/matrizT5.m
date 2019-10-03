function [A,b,u,x,up,error]=matrizT5(n)
h=1/(n-1);
i=1;
beta=-2;
alpha=1+(25*h);
gamma=1-(25*h);
A=zeros(n-1,n-1);
while i<=n-1
    j=1;
    while j<=n-1
        if i==j
            A(i,j)=beta;
        end
        if j==i+1
            A(i,j)=gamma;
        end
        if i==j+1
            A(i,j)=alpha;
        end
        j=j+1;
    end
    i=i+1;
end
b=zeros(n-1,1);
k=1;
while k<=n-1
    if k==n-1
        b(k)=-(gamma);
    end
    k=k+1;
end
u=A\b;
x=zeros(n-1,1);
i=1;
f=inline('(exp(50*x)-1)/(exp(50)-1)');
up=zeros(n-1,1);
while i<=n-1
    x(i)=(i-1)*h;
    up(i)=f(x(i));
    i=i+1;
end
hold on
plot(x,u,'b')
plot(x,up,'y')
hold off
%---------------------------------------
%norma
error= norm((u-up),'inf');
end

