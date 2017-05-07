function [VOR] = VORTICITY(imax,jmax,dx,dy,U,V)

% Description:
%
% This function computes the vorticity on the top-right corner of the
% grid cells.

%% Define parameters
dxi = 1/dx;
dyi = 1/dy;

%% Initialize Storage
VOR = zeros(imax,jmax);

%% Compute Vorticity
for j=1:jmax
  for i=1:imax
    VOR(i,j) = (V(i+1,j)-V(i,j))*dyi - (U(i,j+1)-U(i,j))*dxi;
  end
end

return
end
