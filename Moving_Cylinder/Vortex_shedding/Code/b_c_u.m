function uold=b_c_u(uold,U_w,U_e,U_s,U_n)
uold(2:end-1,1)=U_w; %U_west
%uold(2,2:end-1)=2*U_w-uold(1,2:end-1); %test-free slip
%uold(2,2:end-1)=2*U_s-uold(1,2:end-1); % U_s=0 no slip
uold(1,2:end-1)=uold(2,2:end-1); %free slip
%uold(end-1,2:end-1)=2*U_w-uold(end,2:end-1); %test -free slip
%uold(end-1,2:end-1)=2*U_s-uold(end,2:end-1); %U_n=0 no slip
 uold(end,2:end-1)=uold(end-1,2:end-1); %free slip
uold(2:end-1,end)=uold(2:end-1,end-1); %du_e/dx=0;
%uold(2:end-1,end)=uold(2:end-1,end-1) %du_e/dy=0; outlet bc
end