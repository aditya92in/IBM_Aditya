function [u_star,v_star]=Adams_Bashforth(A_u,D_u,A_v,D_v,uold,vold,dt,dx,dy,rho,i)
u_star=uold;
v_star=vold;
if(i==1)
u_star(2:end-1,2:end-1)=uold(2:end-1,2:end-1)-(dt/(rho*dx*dy))*(A_u(2:end-1,2:end-1,i))+(dt/(rho*dx*dy))*(D_u(2:end-1,2:end-1,i));
v_star(2:end-1,2:end-1)=vold(2:end-1,2:end-1)-(dt/(rho*dx*dy))*(A_v(2:end-1,2:end-1,i))+(dt/(rho*dx*dy))*(D_v(2:end-1,2:end-1,i));
else  
u_star(2:end-1,2:end-1)=uold(2:end-1,2:end-1)-(dt/(rho*dx*dy))*(1.5*A_u(2:end-1,2:end-1,i)-0.5*A_u(2:end-1,2:end-1,i-1))+(dt/(dx*dy))*(1.5*D_u(2:end-1,2:end-1,i)-0.5*(D_u(2:end-1,2:end-1,i-1)));
v_star(2:end-1,2:end-1)=vold(2:end-1,2:end-1)-(dt/(rho*dx*dy))*(1.5*A_v(2:end-1,2:end-1,i)-0.5*A_v(2:end-1,2:end-1,i))+(dt/(dx*dy))*(1.5*D_v(2:end-1,2:end-1,i)-0.5*D_v(2:end-1,2:end-1,i-1));

end