function [du_bar_dt ] = oneD_burgerseq_func(t, u_bar)
% dudt = -dfdx,  f = 1/2 *u_bar^2
% here we use zero boundary condition
dx =  1./ length(u_bar);
f_bar = u_bar .^2 / 2;
f_interface = (f_bar(2:end)  + f_bar(1:end-1))/2;
f_interface =  [0; f_interface;0];
du_bar_dt = - (f_interface(2:end) - f_interface(1:end-1))/dx;
end