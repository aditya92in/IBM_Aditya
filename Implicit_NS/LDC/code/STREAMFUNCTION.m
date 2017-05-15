function [PSI] = STREAMFUNCTION(imax,jmax,dx,dy,U,V)

% Description:
%
% This function solves for the stream function using the V velocity. The
% streamfunction is defined as follows:
%
%    u =  d(psi)/dy
%    v = -d(psi)/dx
%
% psi is defined here at the top-right corner of a grid cell (whereas
% pressure is defined at cell center). psi(1,1)=0 lies exactly on the
% lower-left corner; psi(imax,jmax) lies exactly on the top-right corner.

%% Initialize psi
PSI = zeros(imax,jmax);

%% Compute stream function
for j=2:jmax
  PSI(1,j) = PSI(1,j-1) + dx*U(1,j); % PSI(1,1)=0
end
for i=2:imax
  PSI(i,1:jmax) = PSI(i-1,1:jmax) - dy*V(i,1:jmax);
end

return
end