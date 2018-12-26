% solution for 1d  possion equation
%  0 =dduddx +f(x)
n = 100;
dx = 1/n;
A = zeros(n-1);
k=1;
for i = 1:n-1
    A(i,i) = -2*k/dx.^2;
end
for i = 1:n-2
    A(i,i+1) = k/dx.^2;
    A(i+1, i )  = k/dx.^2;
end
b= zeros(n-1,1);
u0 = zeros(n-1,1);
uleft = 1;
uright = -1;
b(1) = k/dx.^2*uleft;
b(end) = k/dx.^2*uright;
%To solve the matrix equation Ax = b, enter     x=A\b
u =  A\(-b);
f = ones(n-1)*10;
%plot(u)
u = A\(-b-f);
plot(u)
