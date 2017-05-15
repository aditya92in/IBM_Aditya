function [u_star,v_star]=diffusion_solver(rhs_u_star,rhs_v_star,a1,a2,a3,U_w,U_e,U_s,U_n,V_w,V_e,V_s,V_n)
u_star=zeros(size(rhs_u_star));
v_star=zeros(size(rhs_v_star));
res_x=1;
res_y=1;
count_star_y=1;
count_star_x=1;

u_star_new_iter=u_star;
u_star_old_iter=u_star;
[m,n]=size(rhs_u_star);
[m1,n1]=size(rhs_v_star);
v_star_new_iter=v_star;
v_star_old_iter=v_star;

while(res_x>1e-6) &&(count_star_x<40)
    
    u_star_old_iter=b_c_u(u_star_old_iter,U_w,U_e,U_s,U_n);
      for i=2:m-1
        for j=2:n-1
            u_star_new_iter(i,j)= rhs_u_star(i,j)/a3 + ...
                a1*(u_star_old_iter(i,j-1)+u_star_old_iter(i,j+1))*power(a3,-1) +...
            a2*(u_star_old_iter(i-1,j)+u_star_old_iter(i+1,j))*power(a3,-1);
        end
      end
      res_x=norm(u_star_new_iter(2:end-1,2:end-1)-u_star_old_iter(2:end-1,2:end-1));
      u_star_old_iter=u_star_new_iter;
      count_star_x=count_star_x+1;
      
end

while(res_y>1e-6) &&(count_star_y<40)
    v_star_old_iter=b_c_v(v_star_old_iter,V_w,V_e,V_s,V_n);
      for i=2:m1-1
        for j=2:n1-1
            v_star_new_iter(i,j)= rhs_v_star(i,j)/a3 + ...
                a1*(v_star_old_iter(i,j-1)+v_star_old_iter(i,j+1))*power(a3,-1) +...
            a2*(v_star_old_iter(i-1,j)+v_star_old_iter(i+1,j))*power(a3,-1);
        end
      end
      res_y=norm(v_star_new_iter(2:end-1,2:end-1)-v_star_old_iter(2:end-1,2:end-1));
      v_star_old_iter=v_star_new_iter;
      count_star_y=count_star_y+1;
end

u_star=u_star_old_iter;
v_star=v_star_old_iter;


end