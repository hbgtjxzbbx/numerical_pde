% dduddt = dduddx
% phi = dudt  psi = dudx   
% dphidt=dpsidx dpsidt = dphidx
n = 100;
x = [0:n-1]/n * 2 * pi;
phi0 = sin(x/2).^16;
psi0  = phi0*0;
[t, phi_psi]  = ode45(@oneD_waveeq_func, [0,pi], [phi0,psi0]);
close all
plot(x,phi_psi(end,1:n));
plot(x,phi_psi(end,n+1:2*n));
phi_psi0 = [phi0,psi0];
for i = 1:10000
    [t, phi_psi] = ode45(@oneD_waveeq_func,[0,0.1], phi_psi0);
    hold off;
    phi_psi0 = phi_psi(end,:);
     plot(x, phi_psi0(1:n),'b');
     hold on;
    plot(x, phi_psi0(n+1:2*n),'r');
    pause(0.05);
end