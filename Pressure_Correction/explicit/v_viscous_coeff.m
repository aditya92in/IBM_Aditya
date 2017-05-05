function [dv_e,dv_w,dv_s,dv_n]=v_viscous_coeff(vold,dx,dy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dv_s=zeros(size(vold));dv_n=vold;dv_e=vold;dv_w=vold;
dv_s(1,:)=-1;
dv_n(end,:)=-1;
dv_e(:,end)=-1;
dv_w(:,1)=-1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dv_s(2:end,1:end)=(vold(2:end,1:end)-vold(1:end-1,1:end))./(dy); %U_w
dv_n(1:end-1,1:end)=dv_s(2:end,1:end);
%(vold(1:end-1,1:end)+vold(2:end,1:end))*0.5;
dv_e(1:end,1:end-1)=(vold(1:end,2:end)-vold(1:end,1:end-1))./(dx);
dv_w(1:end,2:end)=dv_e(1:end,1:end-1);
%(vold(1:end,2:end)+vold(2:end-1,1:end-1))*0.5;
end