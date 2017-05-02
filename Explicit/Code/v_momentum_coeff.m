function [V_s,V_n,V_e,V_w]=v_momentum_coeff(vold)
%%%%%%%%%%%%%%%%%%%************Making all the interpolation indices the
%%%%%%%%%%%%%%%%%%%same
V_s=zeros(size(vold));V_n=vold;V_e=vold;V_w=vold;
V_s(1,:)=-1;
V_n(end,:)=-1;
V_e(:,end)=-1;
V_w(:,1)=-1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V_s(2:end,1:end)=(vold(2:end,1:end)+vold(1:end-1,1:end))*0.5; %U_w
V_n(1:end-1,1:end)=V_s(2:end,1:end);
%(vold(1:end-1,1:end)+vold(2:end,1:end))*0.5;
V_e(1:end,1:end-1)=(vold(1:end,2:end)+vold(1:end,1:end-1))*0.5;
V_w(1:end,2:end)=V_e(1:end,1:end-1);
%(vold(1:end,2:end)+vold(2:end-1,1:end-1))*0.5;
end

%note
%...stencil for v    o
%                  x . x 
%                o   o   o 
%                  x . x
%                    o 