function [ ddt ] = oneD_waveeq_func(t, phi_psi)
% dduddt = dduddx
% phi = dudt  psi = dudx   
% dphidt=dpsidx dpsidt = dphidx
N = length(phi_psi)/2;
dx =2*pi/N;
phi = phi_psi(1:N);
psi = phi_psi(N+1:end);
dphidx = [(phi(2) - phi(end))/(2*dx); (phi(3:end) - phi(1:end-2))/(2*dx); (phi(1) - phi(end-1))/(2*dx)];
dpsidx = [(psi(2) - psi(end))/(2*dx); (psi(3:end) - psi(1:end-2))/(2*dx); (psi(1) - psi(end-1))/(2*dx)];
dphidt = dpsidx;
dpsidt = dphidx;
ddt = [dphidt; dpsidt];
end