%***************Staggered Grid************************************8
clear all;
close all;
imax=150; %no of grid points in y direction
jmax=150; %no of grid points in x direction
L_x=1;L_y=1;
dy=L_y/(imax);
dx=L_x/(jmax);
dt=0.009;
[x,y]=meshgrid(0:dx:L_x,0:dy:L_y);
%rho=1;
%mu=0.1;
Re=100;
%%
%%%******************************************define my arrays---------------step-1
pnew=ones(imax+2,jmax+2);% no of pressure nodes imax-1,jmax-1
rhs=zeros(imax+2,jmax+2); %rhs used to evaluate the poisson equation
div=zeros(imax+2,jmax+2); %divergence of the matrix
unew=zeros(imax+2,jmax+1); %no of points where x-velocity is defined . Note the extra column!
vnew=zeros(imax+1,jmax+2); %no of points where v-velocity is defined. Note the extra row!
%%%%%%%%%%%%%%%%%%%%%%%%*****************************
%%
%************************step-2 Boundary Conditions
%**************U-velocities
U_e=0;U_w=0;U_n=1;U_s=0;
%****************V-Velocities
V_e=0;V_w=0;V_n=0;V_s=0;
%**************************
%%
%cm=generate_cm(jmax,imax,dx,dy);
n_time_steps=8100;
A_u=zeros(imax+2,jmax+1,3);
D_old_u=zeros(imax+2,jmax+1);
A_v=zeros(imax+1,jmax+2,3);
D_old_v=zeros(imax+1,jmax+2);
count_star=1;
video_iter=0;
%%
%constants for implicit code
a1=0.5*dt/(Re*dx^2);
a2=0.5*dt/(Re*dy^2);
a3=1+(2*a1)+(2*a2);
%%
%unew(5,5)=100;
figure
for i=1:n_time_steps
uold=unew;
vold=vnew;
%**************apply boundary conditions for uold
uold=b_c_u(uold,U_w,U_e,U_s,U_n);
%***************apply boundary conditions for vold
vold=b_c_v(vold,V_w,V_e,V_s,V_n);
%*********************************get u star and vstar
[A_u(2:end-1,2:end-1,count_star),D_old_u(2:end-1,2:end-1),A_v(2:end-1,2:end-1,count_star),D_old_v(2:end-1,2:end-1)]=momentum(uold,vold,dx,dy);
[rhs_u_star,rhs_v_star]=Crank_nicholson(A_u,D_old_u,A_v,D_old_v,uold,vold,dt,dx,dy,Re,count_star);
[u_star,v_star]=diffusion_solver(rhs_u_star,rhs_v_star,a1,a2,a3,U_w,U_e,U_s,U_n,V_w,V_e,V_s,V_n);
%*****************get u star
u_star=b_c_u(u_star,U_w,U_e,U_s,U_n);
v_star=b_c_v(v_star,V_w,V_e,V_s,V_n);
%*************************compute rhs
rhs(2:end-1,2:end-1)=get_rhs(u_star,v_star,dx,dy,dt);
%***************solve the pressure for the intermediate velocities
pnew=solve_poisson(rhs,imax,jmax,dx,dy,pnew);
%*******************correct the velocities through the pressure
%[p_x,p_y]=inter_pre(pnew);
[unew,vnew]=correction(u_star,v_star,pnew,dx,dy,dt);
unew=b_c_u(unew,U_w,U_e,U_s,U_n);
vnew=b_c_v(vnew,V_w,V_e,V_s,V_n);
%[unew,vnew]=correction(u_star,v_star,p_x,p_y,dx,dy,dt,rho);

%for PLOTTING Only
[up,vp]=inter_p(unew,vnew);

%CHECKS
[div]=divergence(unew,vnew,dx,dy);
%******************check the divergence and courant number 

%*********************compute the resdiuals
[res_x,res_y]=res(uold,unew,vold,vnew);
if(mod(i,1)==0)
    video_iter=video_iter+1;
disp(['residual in x=',num2str(res_x),'residual in y=',num2str(res_y),'number of timesteps=',num2str(i),'total time=',num2str(toc)]);
%*****************post processing

%contourf(x(1:end-1,1:end-1),y(1:end-1,1:end-1),pnew(2:end-1,2:end-1))
contourf(x(2:end,2:end),y(2:end,2:end),unew(2:end-1,1:end-1),50);
%quiver(x(2:end,2:end),y(2:end,2:end),unew(2:end-1,1:end-1),vnew(1:end-1,2:end-1),2.5);
%ylim([0+dy L_y]);
%xlim([0+dx L_x]);
title(strcat('u-Velocity Contours (Re 100) at t=',num2str(dt*i)));
colorbar
M(video_iter)=getframe(gcf);
%pause(0.001)
%shading interp
%contourf(pnew(2:end-1,2:end-1))
%contourf(unew)
%colorbar
%subplot(2,1,1)
%title(strcat('u-velocity error',num2str(i)));
%plot(i,res_x,'.','MarkerSize',10)
%xlabel('number of timesteps');
%ylabel('error-(L2 Norm)');
%ylim([0 10e-2])
%yticks([1e-2 2e-2 3e-2 4e-2 5e-2 6e-2 7e-2 8e-2 9e-2 10e-2])%0.6e-3 0.7e-3 0.8e-3 0.9e-3 1e-3])
%hold all
%subplot(2,1,2)

%plot(i,res_y,'.','MarkerSize',10)
%ylim([0 10e-3])
%yticks([1e-3 2e-3 3e-3 4e-3 5e-3 6e-3 7e-3 8e-3 9e-3 10e-3])% 5e-5 6e-5 7e-5 8e-5 9e-5 10e-4 15e-4 20e-4])
%xlabel('number of timesteps');
%ylabel('error-(L2 Norm)');
%hold all
%pause(0.0001)
%project the face velocities onto the nodes
end
if(count_star>=3)
    A_u(:,:,count_star-1)=A_u(:,:,count_star);
    A_v(:,:,count_star-1)=A_v(:,:,count_star);
    %D_u(:,:,count_star-1)=D_u(:,:,count_star);
    %D_v(:,:,count_star-1)=D_v(:,:,count_star);
    count_star=3;
else
    count_star=count_star+1;
end



end
%%
%********Program Check Test u_star, v_star
