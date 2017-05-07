function [unew,vnew,err_corr_u,err_corr_v]= correction(u_d_star,v_d_star,pnew,dt,dx,dy)

    %unew=u_star;
    unew=u_d_star;
    vnew=v_d_star;
%             vnew=v_star;
           unew(2:end-1,2:end-1)=u_d_star(2:end-1,2:end-1)-(pnew(2:end-1,3:end-1)-pnew(2:end-1,2:end-2)).*(dt/dx);
             vnew(2:end-1,2:end-1)=v_d_star(2:end-1,2:end-1)-(pnew(3:end-1,2:end-1)-pnew(2:end-2,2:end-1)).*(dt/dy); 
%             
%            

err_corr_u=norm(unew(2:end-1,2:end-1)-u_d_star(2:end-1,2:end-1));
err_corr_v=norm(vnew(2:end-1,2:end-1)-v_d_star(2:end-1,2:end-1));
%unew(2:end-1,2:end-1)=u_d_star(2:end-1,2:end-1)+fnew_x(2:end-1,2:end-1).*dt;
%vnew(2:end-1,2:end-1)=v_d_star(2:end-1,2:end-1)+fnew_y(2:end-1,2:end-1).*dt;


%disp([' error in unew and u** ',num2str(err_corr_u),'error in vnew and v**',num2str(err_corr_v)]);
%pause(1);
%boundary conditions
%unew(1,:)=-unew(2,:);
%unew(end,:)=-unew(end-1,:);

%boundary conditions
 %vnew(1,:)=0;          
 %vnew(end,:)=0;
 %vnew(:,1)=-vnew(:,2);
 %vnew(:,end)=vnew(:,end-1);

            
end
