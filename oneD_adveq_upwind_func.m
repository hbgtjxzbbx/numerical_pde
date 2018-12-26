function [dudt] = oneD_adveq_upwind_func(t,u)
U=1;
N = length(u);
dx = 2*pi /N;
dudx = [ (u(1) - u(end))/dx; (u(2:end)- u(1:end-1))/dx];
dudt = -U*dudx;
end