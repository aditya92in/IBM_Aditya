function [A_u,D_u,A_v,D_v]=momentum(uold,vold,dx,dy,rho,mu)
%***************************Intialize to uold and vold
I_uxx=zeros(size(uold)); I_vyy=zeros(size(vold));
I_uyy=zeros(size(uold)); I_vxx=zeros(size(vold));
V_uxx=zeros(size(uold)); V_vyy=zeros(size(vold));
V_uyy=zeros(size(uold)); V_vxx=zeros(size(vold));
%*******************************
[U_e,U_w,U_s,U_n]=u_momentum_coeff(uold);
[V_s,V_n,V_e,V_w]=v_momentum_coeff(vold);
[du_e,du_w,du_s,du_n]=u_viscous_coeff(uold,dx,dy);
[dv_e,dv_w,dv_s,dv_n]=v_viscous_coeff(vold,dx,dy);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%***************
I_uxx(2:end-1,2:end-1)=rho*((U_e(2:end-1,2:end-1).^2-U_w(2:end-1,2:end-1).^2))*dy;
%axial component of x momentum
I_uyy(2:end-1,2:end-1)=rho*((-U_s(2:end-1,2:end-1).*V_w(1:end-1,3:end-1)+U_n(2:end-1,2:end-1).*V_w(2:end,3:end-1)))*dx;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V_uxx(2:end-1,2:end-1)=mu*(du_e(2:end-1,2:end-1)-du_w(2:end-1,2:end-1))*dy;
%viscous fluxes in axial direction
V_uyy(2:end-1,2:end-1)=mu*(du_n(2:end-1,2:end-1)-du_s(2:end-1,2:end-1))*dx;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


I_vyy(2:end-1,2:end-1)=rho*((V_n(2:end-1,2:end-1).^2-V_s(2:end-1,2:end-1).^2))*dx;
%axial component of v-momentum
I_vxx(2:end-1,2:end-1)=rho*(-V_w(2:end-1,2:end-1).*U_s(3:end-1,1:end-1)+V_e(2:end-1,2:end-1).*U_s(3:end-1,2:end))*dy;
%transverse component of v-momentum
V_vyy(2:end-1,2:end-1)=mu*(dv_n(2:end-1,2:end-1)-dv_s(2:end-1,2:end-1))*dx;
%viscous fluxes in axial direction
V_vxx(2:end-1,2:end-1)=mu*(dv_e(2:end-1,2:end-1)-dv_w(2:end-1,2:end-1))*dy;




A_u=I_uxx(2:end-1,2:end-1)+I_uyy(2:end-1,2:end-1);
D_u=V_uxx(2:end-1,2:end-1)+V_uyy(2:end-1,2:end-1);
A_v=I_vyy(2:end-1,2:end-1)+I_vxx(2:end-1,2:end-1);
D_v=V_vyy(2:end-1,2:end-1)+V_vxx(2:end-1,2:end-1);


%transverse component of y momentum

%viscous fluxes in transverse direction

%%%%%%%%%%%%%%%%%%%%
%**************-V star%

%visoucs fluxes in transverse direction
%v_star(2:end-1,2:end-1)=(vold(2:end-1,2:end-1)-dt/(rho*dx*dy)*(I_vyy(2:end-1,2:end-1)+I_vxx(2:end-1,2:end-1))+dt/(dx*dy)*(V_vyy(2:end-1,2:end-1)+V_vxx(2:end-1,2:end-1)));
end


%psuedo code

%imax1=number of columns in v
%jmax1=number of rows in v
%imax=number of columns in u
%jmax=number of columns in u


%note 
%               x   
%                   
%           x . x . x     stencil for uold
%
%               x
  
