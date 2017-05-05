function vold=b_c_v(vold,V_w,V_e,V_s,V_n)
vold(2:end-1,2)=2*V_w-vold(2:end-1,1); %V_w=0;
vold(2:end-1,end-1)=vold(2:end-1,end); %dv_e/dx=0;
vold(1,2:end-1)=V_s; %V_s=0; no penetration south
vold(2:end-1,end)=V_n; %V_n=0; no penetration north
end