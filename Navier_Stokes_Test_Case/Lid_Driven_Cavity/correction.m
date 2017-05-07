function [unew,vnew]= correction(u_star,v_star,pnew,dx,dy,dt)

            unew=u_star;
            vnew=v_star;
            unew(2:end-1,2:end-1)=u_star(2:end-1,2:end-1)-(pnew(2:end-1,3:end-1)-pnew(2:end-1,2:end-2)).*(dt/dx);
            vnew(2:end-1,2:end-1)=v_star(2:end-1,2:end-1)-(pnew(3:end-1,2:end-1)-pnew(2:end-2,2:end-1)).*(dt/dy); 
%           unew(1,:)=unew(2,:);
 %           unew(end,:)=unew(end-1,:);
%             vnew(1,:)=0;
%             vnew(end,:)=0;
  %           vnew(:,1)=-vnew(:,2);
   %         vnew(:,end)=vnew(:,end-1);
            
end