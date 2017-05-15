function [rhs_u_star,rhs_v_star]=Crank_nicholson(A_u,D_old_u,A_v,D_old_v,uold,vold,dt,dx,dy,Re,count_star)
%rhs_u_star=uold;
%v_star=vold;
if(count_star==1)
rhs_u_star(2:end-1,2:end-1)=uold(2:end-1,2:end-1)-(dt/(dx*dy))*(A_u(2:end-1,2:end-1,count_star))+(dt/(Re*dx*dy))*(D_old_u(2:end-1,2:end-1));
rhs_v_star(2:end-1,2:end-1)=vold(2:end-1,2:end-1)-(dt/(dx*dy))*(A_v(2:end-1,2:end-1,count_star))+(dt/(Re*dx*dy))*(D_old_v(2:end-1,2:end-1));
else  
rhs_u_star(2:end-1,2:end-1)=uold(2:end-1,2:end-1)-(dt/(dx*dy))*(1.5*A_u(2:end-1,2:end-1,count_star)-0.5*A_u(2:end-1,2:end-1,count_star-1))+(0.5*dt/(Re*dx*dy))*((D_old_u(2:end-1,2:end-1)));
rhs_v_star(2:end-1,2:end-1)=vold(2:end-1,2:end-1)-(dt/(dx*dy))*(1.5*A_v(2:end-1,2:end-1,count_star)-0.5*A_v(2:end-1,2:end-1,count_star-1))+(0.5*dt/(Re*dx*dy))*(D_old_v(2:end-1,2:end-1));

end