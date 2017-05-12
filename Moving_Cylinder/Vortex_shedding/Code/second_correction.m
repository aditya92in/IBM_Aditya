function [u_d_star,v_d_star]=second_correction(u_star,v_star,phi_x,phi_y)

%u_d_star=u_star;
%v_d_star=v_star;
u_d_star=u_star-phi_x.*u_star;
v_d_star=v_star-phi_y.*v_star;
%u_d_star(2:end-1,2:end-1)=u_star(2:end-1,2:end-1)-(pnew(2:end-1,3:end-1)-pnew(2:end-1,2:end-2)).*(dt/dx);
            
%v_d_star(2:end-1,2:end-1)=v_star(2:end-1,2:end-1)-(pnew(3:end-1,2:end-1)-pnew(2:end-2,2:end-1)).*(dt/dy);


end