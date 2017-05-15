function rhs=get_rhs(u_star,v_star,dx,dy,dt)
rhs=(u_star(2:end-1,2:end)-u_star(2:end-1,1:end-1))./(dt*dx)+ (v_star(2:end,2:end-1)-v_star(1:end-1,2:end-1))./(dt*dy);
end