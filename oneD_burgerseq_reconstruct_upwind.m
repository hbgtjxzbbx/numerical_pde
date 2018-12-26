n=100;
x_interface = linspace(0, 1, n+1); 
x = (x_interface(1:end-1) + x_interface(2:end))/2; 
u = sin(x *2 *pi); % actually, we assume  u refers to volume average
plot(u)
u0 = u;
[t,u] = ode45(@oneD_burgerseq_reconstruct_upwind_func,[0,0.1], u0);
x_bar = (x_interface(1:end-1) + x_interface(2:end))/2;
close all
plot(x,u)


% for i = 1:10000
%     [t, u] = ode45(@oneD_burgerseq_upwind_func,[0,0.1], u0);
%     u0 = u(end,:);
%     hold off
%     plot(x, u0,'b');
%     pause(0.5);
% end

