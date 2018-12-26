function [dudt ] = oneD_burgerseq_reconstruct_upwind_func(t, u)
% dudt = -dfdx,  f = 1/2 *u^2
% here we use zero boundary condition
% reconstruct upwind is used
% attention, the u here means u bar
dx =  1./ length(u);
dudx = (u(3:end) - u(1:end-2)) /(2*dx);
dudx = [(u(2) - u(1))/dx; dudx; (u(end) - u(end-1))/dx];
u_right_cell = u + dudx*0.5*dx;
u_left_cell = u - dudx*0.5*dx;
f_right_cell = u_right_cell.^2/2;
f_left_cell = u_left_cell.^2/2;
ss = (u_left_cell(2:end) + u_right_cell (1:end-1))/2; % the speed of the shocked wave, derived from df/du
f_interface = [0];
for i = 2:length(u)
    if ss(i-1)>0
        f_interface = [f_interface; f_right_cell(i-1)];
    else
        f_interface = [f_interface;f_left_cell(i)];
    end
end
f_interface = [f_interface;0];
dudt = - (f_interface(2:end) - f_interface(1:end-1))/dx;
end