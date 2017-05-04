function uold=b_c_u(uold,U_w,U_e,U_s,U_n)
uold(2:end-1,1)=U_w; %U_w=0; no slip
uold(1,2:end-1)=2*U_s-uold(2,2:end-1); % U_s=0 no slip
uold(end,2:end-1)=2*U_n-uold(end-1,2:end-1); %U_n=1
uold(2:end-1,end)=U_e; %U_e=0; no slip

end