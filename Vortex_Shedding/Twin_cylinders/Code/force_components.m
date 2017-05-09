function [F_x,F_y]=force_components(ustar,vstar,u_s,v_s,dt,phi_x,phi_y,dx,dy,rho)


f_x=phi_x.*(u_s-ustar)*(1/dt);
f_y=phi_y.*(v_s-vstar)*(1/dt);


F_x=-(sum(sum(f_x)))*rho*dx*dy;
F_y=-(sum(sum(f_y)))*rho*dx*dy;

end