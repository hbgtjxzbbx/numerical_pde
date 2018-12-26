function [dudt] = oneD_adveq_central_func(t,u)
    U=1;
    N = length(u);
    dx = 2*pi /N;
    dudx = [ (u(2) - u(end))/(2*dx); (u(3:end)-u(1:end-2))/(2*dx); (u(1)- u(end-1))/(2*dx)];
    dudt = -U*dudx;
end