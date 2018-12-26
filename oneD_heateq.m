% solution for 1d  possion equation
%  dudt =dduddx
n = 100;
dx = 1/n;  % attention here should be n not n-1
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

[t,u] = ode45(@(t,u)oneD_heateq_func(t,u,A,b), [0,1],u0');

% function Auplusb = oneD_heateq_func(t,u,A,b)
%     Auplusb =A*u + b;
% end