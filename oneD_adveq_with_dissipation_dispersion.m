n = 100;
x = [0:n-1]/n * 2 * pi;
u0 = sin(x/2).^16;
close all
plot(x,u0,'b')
[t,u] = ode45(@oneD_adveq_upwind_func, [0, 2*pi], u0);
hold on;
plot(x, u(end,:),'r')

% illustration of dissipation or diffusion
n = 2*n;
x = [0:n-1]/n * 2 * pi;
u0 = sin(x/2).^16;
plot(x,u0,'b')
hold on
[t,u] = ode45(@oneD_adveq_upwind_func, [0, 2*pi], u0);
hold on;
plot(x, u(end,:),'g')
[t,u] = ode45(@oneD_adveq_upwind_func, [0, 2*2*pi], u0);  % the dissipation is linearly related with dx
hold on;
plot(x, u(end,:),'k')
[t,u] = ode45(@oneD_adveq_central_func, [0, 2*2*pi], u0);  %  here we use central deriative to avoid dissipation
hold on;
plot(x, u(end,:),'y')


% illustration of dispersion
u0 = sin(x/2).^16;
figure()
plot(x,u0,'b')
[t,u] = ode45(@oneD_adveq_central_func, [0, 20*2*pi], u0);  %  here we show the affect of the dispersion
hold on
plot(x, u(end,:),'g')

u0 = sin(x/2).^16>0.8;
figure()
plot(x,u0,'b')
[t,u] = ode45(@oneD_adveq_central_func, [0, 2*pi], u0);  %  here we show the affect of the dispersion
hold on
plot(x, u(end,:),'g')
[t,u] = ode45(@oneD_adveq_upwind_func, [0, 2*pi], u0);  %  here we show the affect of the dissipation
hold on
plot(x, u(end,:),'k')
