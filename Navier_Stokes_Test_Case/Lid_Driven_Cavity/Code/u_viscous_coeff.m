function [du_e,du_w,du_s,du_n]=u_viscous_coeff(uold,dx,dy)
%%%%%%%%%%%%%%%%%%%%%%%
du_e=zeros(size(uold));du_w=uold;du_n=uold;du_s=uold;
du_e(1:end,end)=-1; %dU_e is not defined for the east most
du_w(1:end,1)=-1;
du_n(end,1:end)=-1; %dU_n is not defined on top face
du_s(1,1:end)=-1; %dU_s is not defined on south face
%**************************************************************
du_e(1:end,1:end-1)=(uold(1:end,2:end)-uold(1:end,1:end-1))./(dx);
du_w(1:end,2:end)=du_e(1:end,1:end-1);
%(uold(1:end,2:end)-uold(1:end,1:end-1))/(dx);
du_s(2:end,1:end)=(uold(2:end,1:end)-uold(1:end-1,1:end))./(dy);
du_n(1:end-1,1:end)=du_s(2:end,1:end);
%(uold(2:end,1:end)-uold(1:end-1,1:end))/(dy);

end