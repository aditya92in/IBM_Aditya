function [u_star,v_star]=Adams_Bashforth(A_u,D_u,A_v,D_v,uold,vold,dt,dx,dy,Re,count_star)
u_star=uold;
v_star=vold;
if(count_star==1)
u_star(2:end-1,2:end-1)=uold(2:end-1,2:end-1)-(dt/(dx*dy))*(A_u(2:end-1,2:end-1,count_star))+(dt/(Re*dx*dy))*(D_u(2:end-1,2:end-1,count_star));
v_star(2:end-1,2:end-1)=vold(2:end-1,2:end-1)-(dt/(dx*dy))*(A_v(2:end-1,2:end-1,count_star))+(dt/(Re*dx*dy))*(D_v(2:end-1,2:end-1,count_star));
else  
u_star(2:end-1,2:end-1)=uold(2:end-1,2:end-1)-(dt/(dx*dy))*(1.5*A_u(2:end-1,2:end-1,count_star)-0.5*A_u(2:end-1,2:end-1,count_star-1))+(dt/(Re*dx*dy))*(1.5*D_u(2:end-1,2:end-1,count_star)-0.5*(D_u(2:end-1,2:end-1,count_star-1)));
v_star(2:end-1,2:end-1)=vold(2:end-1,2:end-1)-(dt/(dx*dy))*(1.5*A_v(2:end-1,2:end-1,count_star)-0.5*A_v(2:end-1,2:end-1,count_star-1))+(dt/(Re*dx*dy))*(1.5*D_v(2:end-1,2:end-1,count_star)-0.5*D_v(2:end-1,2:end-1,count_star-1));

end
