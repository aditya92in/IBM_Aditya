function vold=b_c_v(vold,V_w,V_e,V_s,V_n)
vold(2:end-1,2)=2*V_w-vold(2:end-1,1); %no penetration west
vold(2:end-1,end-1)=2*V_e-vold(2:end-1,end); %no penetration east
vold(1,2:end-1)=V_s; %V_s=0; no penetration south
vold(end,2:end-1)=V_n; %V_n=0; no penetration north
end