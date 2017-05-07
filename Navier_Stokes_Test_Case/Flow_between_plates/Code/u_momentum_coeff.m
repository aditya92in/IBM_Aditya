function [U_e,U_w,U_s,U_n]=u_momentum_coeff(uold)
%***********************making all the interpolation indices the same
U_e=zeros(size(uold));U_w=uold;U_n=uold;U_s=uold;
U_e(1:end,end)=-1; %U_e is not defined for the east most
U_w(1:end,1)=-1;
U_n(end,1:end)=-1; %U_n is not defined on top face
U_s(1,1:end)=-1; %U_s is not defined on south face
%**************************************************************
U_e(1:end,1:end-1)=(uold(1:end,2:end)+uold(1:end,1:end-1))*0.5;
U_w(1:end,2:end)=U_e(1:end,1:end-1);
%(uold(1:end,2:end)+uold(1:end,1:end-1))*0.5;
U_s(2:end,1:end)=(uold(2:end,1:end)+uold(1:end-1,1:end))*0.5;
U_n(1:end-1,1:end)=U_s(2:end,1:end);
%(uold(2:end,1:end)+uold(1:end-1,1:end))*0.5;
    
end

