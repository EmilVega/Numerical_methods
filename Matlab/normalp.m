function [eInf]=normalp(n,p)
h=1/(n-1);
gamma=1-25*h;
beta=-2;
alfa=1+25*h;
b=[zeros(n-3,1);-(gamma)];
A=diag(beta*ones(n-2,1))+diag((gamma*ones(n-3,1)),1)+diag((alfa*ones(n-3,1)),-1);
u=A\b;
x=linspace(h,1-h,n-2);
f=inline('(exp(50*x)-1)/(exp(50)-1)');

y=f(x);
np=abs((y'-u)).^p;
%p=(y'-u).^2;
%sum=0;
%for i=1:n-4 
 %   sum=normp(i)+sum;
%end
%sum=sum*h;
%sum1=(normp(1)+normp(n-2))*(h/2);
eInf=(h*(sum(np(2:n-3)))+((h/2)*(np(1)+np(n-2))));
%error=(sum+sum1)^(1/p);
if p==2
    eInf=sqrt(eInf);
end
