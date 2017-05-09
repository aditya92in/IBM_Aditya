function [unew,vnew]= correction(u_d_star,v_d_star,pcorr,dt,dx,dy)

    %unew=u_star;
    unew=u_d_star;
    vnew=v_d_star;
%             vnew=v_star;
           unew(2:end-1,2:end-1)=u_d_star(2:end-1,2:end-1)-(pcorr(2:end-1,3:end-1)-pcorr(2:end-1,2:end-2)).*(dt/dx);
           vnew(2:end-1,2:end-1)=v_d_star(2:end-1,2:end-1)-(pcorr(3:end-1,2:end-1)-pcorr(2:end-2,2:end-1)).*(dt/dy); 
%             
%            


%unew(2:end-1,2:end-1)=u_d_star(2:end-1,2:end-1)+fnew_x(2:end-1,2:end-1).*dt;
%vnew(2:end-1,2:end-1)=v_d_star(2:end-1,2:end-1)+fnew_y(2:end-1,2:end-1).*dt;

%boundary conditions
%unew(1,:)=unew(2,:);
%unew(end,:)=unew(end-1,:);

%boundary conditions
% vnew(:,1)=-vnew(:,2);
 %vnew(:,end)=vnew(:,end-1);

            
end
