% Ax = f(x),  here A is the possion matrix, f is the second order, with
% zero boundary condition
nx = 64;
ny = 64;
dx = 2*1/(nx);  % attention here should be nx, not nx-1
dy = 2*1/(ny);
diag_block = eye(ny-1) * (-2/dx^2 -2/dy^2);
diag_block = diag_block + diag(ones(ny-2,1)/dy^2,1);
diag_block = diag_block + diag(ones(ny-2,1)/dy^2,-1);
Matrix = kron(eye(nx-1), diag_block);
Matrix = Matrix  + diag(ones((nx-2)*(ny-1),1)/dx^2,ny-1);
Matrix = Matrix  + diag(ones((nx-2)*(ny-1),1)/dx^2,-(ny-1));
%spy(Matrix)
x= [1 : nx-1] * dx;
y =[ 1: ny-1] * dy;
[Y, X] = meshgrid(x,y);
F = sin(X) .*cos(Y);
f = reshape(F', (nx-1)*(ny-1),1);
close all
surf(X,Y,F)
xlabel('X')
ylabel('Y')
u = Matrix\f;
U = reshape(u, ny-1,nx-1)';
figure();
surf(X,Y,U)
xlabel('X')
ylabel('Y')

% here we set the lef  boundary to be 1,
ux0 = ones(ny-1,1);
f(1:ny-1) = f(1:ny-1) - ux0/dx^2;
u = Matrix\f;
U = reshape(u, ny-1, nx-1)';
figure();
surf(X,Y,U)