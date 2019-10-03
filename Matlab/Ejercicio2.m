A=[5 3 2 4;4 15 -4 0;-3 -2 -29 -2;-2 4 4 -9]
n=4;
U=A;
m21 = U(2,1)/U(1,1);
E21 = eye(n);
E21(2,:) = E21(2,:)-m21*E21(1,:);
U=E21*U;
m31 = U(3,1)/U(1,1);
E31 = eye(n);
E31(3,:)= E31(3,:)-m31*E31(1,:);
U=E31*U;
m41=U(4,1)/U(1,1);
E41=eye(n);
E41(4,:)= E41(4,:)-m41*E41(1,:);
U=E41*U;
m32=U(3,2)/U(2,2);
E32=eye(n);
E32(3,:)= E32(3,:)-m32*E32(2,:);
U=E32*U;
m42=U(4,2)/U(2,2);
E42=eye(n);
E42(4,:)= E42(4,:)-m42*E42(2,:);
U=E42*U;
m43=U(4,3)/U(3,3);
E43=eye(n);
E43(4,:)= E43(4,:)-m43*E43(3,:);
U=E43*U
L=eye(n);
L(2,1)=m21;
L(3,1)=m31;
L(4,1)=m41;
L(3,2)=m32;
L(4,2)=m42;
L(4,3)=m43;
LxU = L*U
A
E = E43*E42*E32*E41*E31*E21
ExA=E*A
U
E21Inv = eye(n); E21Inv(2,1)=m21
E21
E31Inv = eye(n); E31Inv(3,1)=m31
E31
E41Inv = eye(n); E41Inv(4,1)=m41
E41
E32Inv = eye(n); E32Inv(3,2)=m32
E32
E42Inv = eye(n); E42Inv(4,2)=m42
E42
E43Inv = eye(n); E43Inv(4,3)=m43
E43
EInv = E21Inv*E31Inv*E41Inv*E32Inv*E42Inv*E43Inv
L
