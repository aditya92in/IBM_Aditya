%***************Staggered Grid************************************8
clear all;
close all;
imax=200; %no of grid points in y direction
jmax=200; %no of grid points in x direction
L_x=30;L_y=30;
%imax=100; %tests. COMMENT IMMEDIATELY after TESTING 
%jmax=100; %test     COMMENT IMMEDIATELY after TESTING 
%L_x=20; %test      COMMENT IMMEDIATELY after TESTING 
%L_y=20; %test         COMMENT IMMEDIATELY after TESTING 
dy=L_y/(imax);
dx=L_x/(jmax);
dt=0.05;
%%%%%%%%Special treatment of the domain
%absolute coordinate system
%defined for only pressure nodes
%%
[x,y]=meshgrid(-dx/2:dx:L_x+dx/2,-dy/2:dy:L_y+dy/2);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%centre of the cylinder
x_c=0.55*L_x;
y_c=0.5*L_y;
c=[x_c,y_c];
%%%%%%%%%%%%%%%
%rho=0.1;
%mu=0.01;
Re=100;
r=1;
%grid_plotting(x_c,y_c,imax,jmax,x,y,r);
rho=1; %used for only Cd and Cl
%%
%%
%%%******************************************define my arrays---------------step-1
pnew=ones(imax+2,jmax+2);% no of pressure nodes imax-1,jmax-1
rhs=zeros(imax+2,jmax+2); %rhs used to evaluate the poisson equation
div=zeros(imax+2,jmax+2); %divergence of the matrix
unew=ones(imax+2,jmax+1); %no of points where x-velocity is defined . Note the extra column!
vnew=zeros(imax+1,jmax+2); %no of points where v-velocity is defined. Note the extra row!
%%%%%%%%%%%%%%%%%%%%%%%%*****************************
%%%%%%%%%%%%%%%%%%
phi=zeros(imax+2,jmax+2); %defining a global phi
phi=set_phi(phi,imax,jmax,x_c,y_c,x,y,r);%define phi inside the solid cylinder to be 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
phi_x=0.5*(phi(1:end,1:end-1)+phi(1:end,2:end));
phi_y=0.5*(phi(1:end-1,1:end)+phi(2:end,1:end));
%%
%%%%%%%%%%%%%%%%Solid Velocity
u_s=zeros(size(unew));
v_s=zeros(size(vnew));
%************************step-2 Boundary Conditions
%**************U-velocities
U_e=0;U_w=1;U_n=0;U_s=0;
%****************V-Velocities
V_e=0;V_w=0;V_n=0;V_s=0;
%**************************
%%
%cm=generate_cm(jmax,imax,dx,dy);
n_time_steps=15000;
A_u=zeros(imax+2,jmax+1,3);
D_u=zeros(imax+2,jmax+1,3);
A_v=zeros(imax+1,jmax+2,3);
D_v=zeros(imax+1,jmax+2,3);
count_star=1;
video_iter=0;
%%
C_d_arr=zeros(1,n_time_steps);
C_l_arr=zeros(1,n_time_steps);
err_pois=zeros(1,n_time_steps);
err_corre_u=zeros(1,n_time_steps);
err_corre_v=zeros(1,n_time_steps);
%%
for i=1:n_time_steps
    tic
uold=unew;
vold=vnew;
%**************apply boundary conditions for uold
uold=b_c_u(uold,U_w,U_e,U_s,U_n);
%***************apply boundary conditions for vold
vold=b_c_v(vold,V_w,V_e,V_s,V_n);
%*********************************get u star and vstar
[A_u(2:end-1,2:end-1,count_star),D_u(2:end-1,2:end-1,count_star),A_v(2:end-1,2:end-1,count_star),D_v(2:end-1,2:end-1,count_star)]=momentum(uold,vold,dx,dy);
[u_star,v_star]=Adams_Bashforth(A_u,D_u,A_v,D_v,uold,vold,dt,dx,dy,Re,count_star);
[F_x,F_y]=force_components(u_star,v_star,u_s,v_s,dt,phi_x,phi_y,dx,dy,rho);
[C_d,C_l]=integral_quant(F_x,F_y,2*r,U_w,rho);
C_d_arr(i)=C_d;
C_l_arr(i)=C_l;

% if(i>3)
%         A_u(:,:,(1:i-2))=[];
%         D_u(:,:,(1:i-2))=[];
%         A_v(:,:,(1:i-2))=[];
%         D_v(:,:,(1:i-2))=[];
%        
% end
        
%*****************get u star
%*************************compute rhs
%rhs(2:end-1,2:end-1)=get_rhs(u_star,v_star,dx,dy,dt,rho);
%***************solve the pressure for the intermediate velocities
%pnew=solve_poisson(rhs,imax,jmax,dx,dy,pnew);
[u_d_star,v_d_star]=second_correction(u_star,v_star,phi_x,phi_y);
rhs(2:end-1,2:end-1)=get_rhs(u_d_star,v_d_star,dx,dy,dt);
[pnew,err_pos]=solve_poisson(rhs,imax,jmax,dx,dy,pnew);
err_pois(i)=err_pos;
%[fnew_x,fnew_y]=force_components(uo,vold,u_s,v_s,dt,phi_x,phi_y,dx,dy,rho);

%*******************correct the velocities through the pressure
%[p_x,p_y]=inter_pre(pnew);
[unew,vnew,err_corr_u,err_corr_v]=correction(u_d_star,v_d_star,pnew,dt,dx,dy);
err_corre_u(i)=err_corr_u;
err_corre_v(i)=err_corr_v;
%[unew,vnew]=correction(u_star,v_star,p_x,p_y,dx,dy,dt,rho);

%for PLOTTING Only
[up,vp]=inter_p(unew,vnew);

%CHECKS
[div]=divergence(unew,vnew,dx,dy);
%******************check the divergence and courant number 

%*********************compute the resdiuals
[res_x,res_y]=res(uold,unew,vold,vnew);
%toc;

psi=STREAMFUNCTION(imax,jmax,dx,dy,unew',vnew');
vort=VORTICITY(imax,jmax,dx,dy,unew',vnew');
%*****************post processing
 if(mod(i,10)==0)%&&(err<1.5e-2) 
     video_iter=video_iter+1;
     disp(['residual in x= ',num2str(res_x),' residual in y=',num2str(res_y),' number of timesteps=',num2str(i),' C_d=',num2str(C_d),' C_l=',num2str(C_l),'error in poisson',num2str(err_pos)]);
     %contour(x(2:end-1,2:end-1),y(2:end-1,2:end-1),psi',150)
     contourf(x(2:end-1,2:end-1),y(2:end-1,2:end-1),up);
     
     %caxis([-0.2 1.2]);
     %streamline(x(2:end-1,2:end-1),y(2:end-1,2:end-1),unew(2:end-1,1:end-1),vnew(1:end-1,2:end-1),x(1,20)*ones(size(y(68:140,1))),y(68:140,20));hold on;
  %colorbar
  %colormap 'default'
%contourf(x(2:end-1,2:end-1),y(2:end-1,2:end-1),pnew(2:end-1,2:end-1),30);
%title(num2str(strcat('Pressure Contours(Re 100) at ',num2str(i))));
 %colorbar
 %caxis([-1.5 1.5]);
%contourf(x,y,pnew,'edgecolor','none');
%quiver(x(2:end-1,2:end-1),y(2:end-1,2:end-1),unew(2:end-1,1:end-1),vnew(1:end-1,2:end-1),2);
title(num2str(strcat('Velocity Contours(Re 100) at ',num2str(i))));
colorbar
hold on
 grid_plotting(x_c,y_c,imax,jmax,x,y,r);
 axis equal;
%

%colorbar
%colorbar('YTick',linspace(-1.5,1.5,20));
%xlabel('x (m)');
 %ylabel('y (m)');
 %title(strcat('Re-100-velocity vectors time step',num2str(i)))
%hold on
%grid_plotting(x_c,y_c,imax,jmax,x,y,r);
 M(video_iter)=getframe(gcf);
 hold off
 end
 %hold off
%  subplot(2,1,1)
%  plot(i,C_d,'.r','MarkerSize',10);
%  xlabel('timestep');
%  ylabel('C_d');
%  title(strcat('Re-',num2str(Re)));
%  hold all
%  ylim([0 2]);
%  subplot(2,1,2)
%  plot(i,C_l,'.b','MarkerSize',10);
%  xlabel('timestep');
%  ylabel('C_l');
%  hold all
%  title(strcat('Re-',num2str(Re)));
%  ylim([-1 1]);
 %pause(0.00001);
 
 %end
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
%title(strcat('v-velocity error',num2str(i)));
%plot(i,res_y,'.','MarkerSize',10)
%ylim([0 10e-3])
%yticks([1e-3 2e-3 3e-3 4e-3 5e-3 6e-3 7e-3 8e-3 9e-3 10e-3])% 5e-5 6e-5 7e-5 8e-5 9e-5 10e-4 15e-4 20e-4])
%xlabel('number of timesteps');
%ylabel('error-(L2 Norm)');
%hold all
%pause(0.0001)
%project the face velocities onto the nodes
 
 
%  plot(i,res_x,'.r','MarkerSize',10);
%  hold all;
%  pause(0.000001);

if(count_star>=3)
        A_u(:,:,count_star-1)=A_u(:,:,count_star);
        A_v(:,:,count_star-1)=A_v(:,:,count_star);
        D_u(:,:,count_star-1)=D_u(:,:,count_star);
        D_v(:,:,count_star-1)=D_v(:,:,count_star);
        count_star=3;
        
else
    count_star=count_star+1;
        
end

end
%%
%********Program Check Test u_star, v_star
