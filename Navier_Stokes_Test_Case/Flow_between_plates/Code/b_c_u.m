function uold=b_c_u(uold,U_w,U_e,U_s,U_n)
uold(2:end-1,1)=U_w; %U_west
uold(1,2:end-1)=2*U_s-uold(2,2:end-1); % U_s=0 no slip
uold(end,2:end-1)=2*U_n-uold(end-1,2:end-1); %U_n=0 no slip
uold(2:end-1,end)=uold(2:end-1,end-1); %du_e/dx=0;

end