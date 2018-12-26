function [dudt ] = oneD_burgerseq_upwind_func(t, u)
% dudt = -dfdx,  f = 1/2 *u^2
% here we use zero boundary condition
% upwind is used
% attention, the u here refers to u_bar
dx =  1./ length(u);
f = u .^2 / 2;
ss = (u(2:end) + u (1:end-1))/2; % the speed of the shocked wave, derived from df/du
f_interface = [0];
for i = 2:length(u)
    if ss(i-1)>0
        f_interface = [f_interface; f(i-1)];
    else
        f_interface = [f_interface;f(i)];
    end
end
f_interface = [f_interface;0];
dudt = - (f_interface(2:end) - f_interface(1:end-1))/dx;
end