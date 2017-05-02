function [PSI] = STREAMFUNCTION(imax,jmax,dx,dy,U,V)
PSI = zeros(imax,jmax);
for j=2:jmax
  PSI(1,j) = PSI(1,j-1) + dx*U(1,j); % PSI(1,1)=0
end
for i=2:imax
  PSI(i,1:jmax) = PSI(i-1,1:jmax) - dy*V(i,1:jmax);
end

return
end
